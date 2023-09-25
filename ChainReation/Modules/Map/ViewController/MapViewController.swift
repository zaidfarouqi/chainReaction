//
//  MapViewController.swift
//  ChainReation
//
//  Created by zaid farouqi on 24/09/2023.
//

import UIKit
import CoreLocation
import MapKit

class MapViewController: BaseViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var noResultView: UIView!
    @IBOutlet weak var cityNameLabel: UILabel!
    weak var coordinator : MainCoordinator?
    var viewModel: MapViewModel!
    var photosArray = [Photo]()
    let threshold:CGFloat = 100.0
    var isLoadingMore = false
    var page = 1
    var lastPage = 1
    var cityName:String!{
        didSet{
            cityNameLabel.text = cityName == nil ? "" : "City: \(cityName ?? "")"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MapViewModel(delegate: self)
        setupMapView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.checkLocationPermission()
    }
    func setupMapView(){
        mapView.showsUserLocation = true
        mapView.delegate = self
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        mapView.isPitchEnabled = true
        mapView.isRotateEnabled = true
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
        mapView.addGestureRecognizer(longPressRecognizer)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        mapView.addGestureRecognizer(tapGestureRecognizer)
    }
    func setMapRegion() {
      
        if let userLocation = mapView.userLocation.location?.coordinate {
            let region = MKCoordinateRegion(center: userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
            mapView.setRegion(region, animated: true)
            self.page = 1
            self.handleCityFetching(lat: userLocation.latitude, long: userLocation.longitude)
        }

    }
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer) {
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            
            mapView(self.mapView, didLongPressAt: coordinate)
        }
    }
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        if gestureRecognizer.state == .ended {
            let touchPoint = gestureRecognizer.location(in: mapView)
            let coordinate = mapView.convert(touchPoint, toCoordinateFrom: mapView)
            mapView(self.mapView, didLongPressAt: coordinate)
        }
    }
    func handleCityFetching(lat:CLLocationDegrees,long:CLLocationDegrees){
        self.startLoading()
        viewModel.getCityName(latitude: lat, longitude: long) { cityName in
            if let cityName = cityName {
                self.cityName = cityName
                self.noResultView.isHidden = true
                self.photosArray.removeAll()
                self.tableview.reloadData()
                self.viewModel.getPhotos(city: cityName,page: self.page)
            }else{
                self.cityName = nil
                self.noResultView.isHidden = false
                self.photosArray.removeAll()
                self.tableview.reloadData()
                self.stopLoading()
            }
        }
    }
    
}
extension MapViewController: MapViewModelDelegate {
    
    
    func showLocationPermissionPopup() {
        let alert = UIAlertController(title: "Location Access Required",
                                      message: "This app needs access to your location to provide personalized content and services.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showGPSPermissionPopup() {
        let alert = UIAlertController(title: "GPS Access Required",
                                      message: "This app needs access to your GPS for accurate location tracking.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
            }
        }))
        self.present(alert, animated: true, completion: nil)
    }
    func getCurrentLocation() {
        self.setMapRegion()
        let locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestLocation()
    }
    func photosFetched(array: [Photo],lastPage:Int) {
        self.lastPage = lastPage
        if self.page == 1{
            self.photosArray = array
        }else{
            self.photosArray += array
        }
        self.tableview.reloadData()
        self.stopLoading()
        self.isLoadingMore = false
    }
    
}
extension MapViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location retrieval error: \(error.localizedDescription)")
    }
}
extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {

        mapView.removeAnnotations(mapView.annotations)
        let marker = MKPointAnnotation()
        marker.coordinate = coordinate
        marker.title = "marker"
        mapView.addAnnotation(marker)
        self.page = 1
        self.handleCityFetching(lat: coordinate.latitude, long: coordinate.longitude)

    }
}
extension MapViewController : UITableViewDelegate, UITableViewDataSource  {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = Bundle.main.loadNibNamed("mapTableViewCell", owner: self, options: nil)!.last as! mapTableViewCell
        cell.selectionStyle = .none
        let obj = photosArray[indexPath.row]
        cell.initView(img: obj.urls?.small ?? "", author: obj.user?.name ?? "", authourImage: obj.user?.profile_image?.small ?? "", desc: obj.description ?? "")
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var pictures = [CollieGalleryPicture]()
        for i in photosArray{
            let picture = CollieGalleryPicture(url: i.urls?.full ?? "",title: i.user?.name ?? "")
            pictures.append(picture)
        }
        let gallery = CollieGallery(pictures: pictures)
        gallery.presentInViewController(self)
        gallery.scrollToIndex(indexPath.row)

    }
    
    
}
extension MapViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if !isLoadingMore && (maximumOffset - contentOffset <= threshold) && (contentOffset > 0) && page < lastPage{
            self.isLoadingMore = true
            self.page = self.page + 1
            self.viewModel.getPhotos(city: cityName,page: self.page)
        }
    }
}
