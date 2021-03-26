//
//  LoginViewControllerRepresentation.swift
//  SwiftUIDemo
//
//  Created by lephuongtien on 3/25/21.
//

import UIKit
import SwiftUI

struct LoginViewControllerRepresentation: UIViewControllerRepresentable {

    typealias UIViewControllerType = LoginViewController
    
    func makeUIViewController(context: Context) -> LoginViewController {
        let vc = LoginViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: LoginViewController, context: Context) {
        print("updating")
    }
    
}

struct LoginViewControllerPreviews: PreviewProvider {
  static var previews: some View {
    LoginViewControllerRepresentation()
  }
}
