//
//  MainCoordinator.swift
//  MotoryMazad
//
//  Created by zaid on 20/11/2022.
//

import Foundation
import UIKit

class MainCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    var window: UIWindow? {
        return UIApplication.shared.windows.first
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        navigationController.delegate = self
        let vc:SplashViewController  = UIStoryboard(storyboard: UIStoryboard.Storyboard.Splash).instantiateViewController()
        vc.coordinator = self
        navigationController.viewControllers = [vc]
    }
    func MapScreen(navController : UINavigationController) {
        let vc:MapViewController  = UIStoryboard(storyboard: UIStoryboard.Storyboard.Map).instantiateViewController()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    deinit {
        print("MainCoordinator Deinit")
    }

    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }

   
    
}

 
