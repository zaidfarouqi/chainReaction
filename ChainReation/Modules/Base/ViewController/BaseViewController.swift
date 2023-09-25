//
//  BaseViewController.swift
//   
//
//  Created by zaid farouqi on 13/06/2023.
//

import UIKit
import JGProgressHUD

class BaseViewController: UIViewController {
    
     let hud = JGProgressHUD(style: .dark)

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden (true, animated: false)
        super.viewWillAppear(animated)
   
    }
   
    func startLoading() {
        hud.textLabel.text = "Loading"
        hud.style = .dark
        hud.show(in: self.view)
    }
    
    func stopLoading() {
        hud.dismiss()
    }
   
    
}
