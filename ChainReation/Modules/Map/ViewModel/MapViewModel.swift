//
//  MapViewModel.swift
//  ChainReation
//
//  Created by zaid farouqi on 24/09/2023.
//

import Foundation
import CoreLocation

protocol MapViewModelDelegate: AnyObject {
    func showLocationPermissionPopup()
    func showGPSPermissionPopup()
    func getCurrentLocation()
    func photosFetched(array:[Photo],lastPage:Int)
}

class MapViewModel:NSObject,CLLocationManagerDelegate {
    
    weak var delegate: MapViewModelDelegate?
    private var locationManager: CLLocationManager
    
    init(delegate: MapViewModelDelegate) {
        self.delegate = delegate
        self.locationManager = CLLocationManager()
        super.init()
        self.locationManager.delegate = self
    }
    
    func checkLocationPermission() {
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            delegate?.showLocationPermissionPopup()
        case .authorizedAlways, .authorizedWhenInUse:
            DispatchQueue.global().async {
                self.checkGPSPermission()
            }
        @unknown default:
            break
        }
    }
    
    func checkGPSPermission() {
        if CLLocationManager.locationServicesEnabled() {
            DispatchQueue.main.async {
                switch self.locationManager.accuracyAuthorization {
                case .fullAccuracy:
                    self.delegate?.getCurrentLocation()
                case .reducedAccuracy:
                    self.delegate?.showGPSPermissionPopup()
                @unknown default:
                    break
                }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        DispatchQueue.main.async {
            if status == .authorizedWhenInUse || status == .authorizedAlways {
                self.checkLocationPermission() // Recheck location permissions when authorization changes
            }
        }
    }
    func getCityName(latitude: CLLocationDegrees, longitude: CLLocationDegrees, completion: @escaping (String?) -> Void) {
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if let error = error {
                print("Reverse geocoding error: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            if let placemark = placemarks?.first {
                if let city = placemark.locality {
                    completion(city)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
    func getPhotos(city:String,page:Int){
        unsplashManager().getCityImages(city: city,page: page) { isSuccess,message,object  in
            if isSuccess ?? false{
                DispatchQueue.main.async {
                    self.delegate?.photosFetched(array: object?.results ?? [Photo](),lastPage: object?.total_pages ?? 1)
                }
            }else{
                print(message ?? "")
            }
             
        }
    }
}

