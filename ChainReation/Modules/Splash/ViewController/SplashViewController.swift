//
//  SplashViewController.swift
//  ChainReation
//
//  Created by zaid farouqi on 24/09/2023.
//

import UIKit

class SplashViewController: BaseViewController {

    weak var coordinator : MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

      startApp()
    }
    func startApp(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            guard let coordinator = self.coordinator else {return}
            self.coordinator?.MapScreen(navController: coordinator.navigationController)
        }
    }

   

}
