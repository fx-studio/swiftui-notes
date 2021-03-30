//
//  MyColorUISlider.swift
//  SwiftUIDemo
//
//  Created by lephuongtien on 3/29/21.
//

import UIKit
import SwiftUI

struct MyColorUISlider: UIViewRepresentable {
    typealias UIViewType = UISlider
    
    var color: UIColor
    @Binding var value: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.value = Float(value)
        slider.thumbTintColor = color
        slider.tintColor = color

        // target
        slider.addTarget(context.coordinator, action: #selector(Coordinator.updateColorUISlider(_:)), for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        print("updating")
        uiView.value = Float(self.value)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    //MARK: Coordinator
    class Coordinator: NSObject {
        var parent: MyColorUISlider

        init(_ parent: MyColorUISlider) {
            self.parent = parent
        }

        @objc func updateColorUISlider(_ sender: UISlider) {
         parent.value = Double(sender.value)
        }
    }
}

struct MyColorUISlider_Previews: PreviewProvider {
    static var previews: some View {
        MyColorUISlider(color: .red, value: .constant(0.5))
    }
}
