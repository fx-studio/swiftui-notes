//
//  ViewController.swift
//  UIKitDemo
//
//  Created by Le Phuong Tien on 3/22/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func openUserView(_ coder: NSCoder) -> UIViewController? {
        let user = UserView(name: "Fx Studio") { (name) in
            print("UIKit > selected: \(name)")
        }
        return UIHostingController(coder: coder, rootView: user)
    }
    
    @IBAction func openUser2(_ sender: Any) {
        let user = UserView(name: "Fx Studio 2") { (name) in
            print("UIKit > selected: \(name)")
        }
        
        let vc = UIHostingController(rootView: user)
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

