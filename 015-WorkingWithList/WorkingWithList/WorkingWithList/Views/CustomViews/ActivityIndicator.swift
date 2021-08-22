//
//  ActivityIndicator.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/22/21.
//

import SwiftUI
import UIKit

struct ActivityIndicator: UIViewRepresentable {

    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator(style: .medium)
    }
}
