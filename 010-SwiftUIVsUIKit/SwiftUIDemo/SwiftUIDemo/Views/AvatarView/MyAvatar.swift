//
//  MyAvatar.swift
//  SwiftUIDemo
//
//  Created by lephuongtien on 3/30/21.
//

import UIKit
import SwiftUI

struct MyAvatar: UIViewRepresentable {
    
    var name: String
    var color: UIColor {
        UIColor(red: CGFloat(redValue), green: CGFloat(greenValue), blue: CGFloat(blueValue), alpha: 1.0)
    }

    @Binding var redValue: Double
    @Binding var blueValue: Double
    @Binding var greenValue: Double
    
    typealias UIViewType = AvatarView
    
    func makeUIView(context: Context) -> AvatarView {
        let avatarView = Bundle.main.loadNibNamed("AvatarView", owner: nil, options: nil)?.first as! AvatarView
        
        avatarView.name = name
        avatarView.color = color
        avatarView.updateView()
        avatarView.delegate = context.coordinator
        
        return avatarView
    }
    
    func updateUIView(_ uiView: AvatarView, context: Context) {
        print("updating")
        uiView.name = name
        uiView.color = color
        uiView.updateView()
    }
    
    //MARK: Coordinator
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, AvatarViewDelegate {

        var parent: MyAvatar

        init(_ parent: MyAvatar) {
            self.parent = parent
        }

        //MARK: Delegate
        func avatarView(avatarView: AvatarView, name: String) {
            parent.redValue = Double.random(in: 0...1)
            parent.blueValue = Double.random(in: 0...1)
            parent.greenValue = Double.random(in: 0...1)
        }
    }
}


struct MyAvatar_Preview : PreviewProvider {
    static var previews: some View {
        MyAvatar(name: "Fx Studio", redValue: .constant(1.0), blueValue: .constant(0.5), greenValue: .constant(0.5))
    }
}
