//
//  AppDelegate.swift
//  ChainReation
//
//  Created by zaid farouqi on 24/09/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: MainCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        initCoordinator()
        return true
    }
    func initCoordinator() {
        // send that into our coordinator so that it can display view controllers
        coordinator = MainCoordinator(navigationController: UINavigationController())
        // tell the coordinator to take over control
        coordinator?.start()
        // create a basic UIWindow and activate it
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = coordinator?.navigationController
        window?.makeKeyAndVisible()
    }
   


}

