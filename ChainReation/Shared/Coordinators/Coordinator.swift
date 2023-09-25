//
//  Coordinator.swift
//  MotoryMazad
//
//  Created by zaid on 20/11/2022.
//

import Foundation
import UIKit

@objc protocol Coordinator: AnyObject {
//    var navigationController: UINavigationController { get set }
    
    @objc optional func start()
    
    func childDidFinish(_ child: Coordinator?)
    var childCoordinators: [Coordinator] { get set }
    
    @objc optional func auctionDetailsDeepLink(id : Int , type : String)
    @objc optional func listingDeepLink(tapIndex : Int , status : String)
    @objc optional func openNotificationDetails(id : Int)
    @objc optional func openBannerDetails(id : String)
    @objc optional func openBrokenLink()
    @objc optional func openNotificationListing()
}
