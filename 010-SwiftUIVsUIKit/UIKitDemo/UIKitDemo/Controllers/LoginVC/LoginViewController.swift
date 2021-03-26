//
//  LoginViewController.swift
//  UIKitDemo
//
//  Created by lephuongtien on 3/25/21.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        parent?.navigationItem.title = "Login"
//    }
    
    
    @IBAction func login(_ sender: Any) {
        let userView = UserView(name: "Fx Studio") { (name) in
            print("Selected : \(name)")
        }
        
        let vc = UIHostingController(rootView: userView)
        vc.navigationItem.title = "Profile"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
