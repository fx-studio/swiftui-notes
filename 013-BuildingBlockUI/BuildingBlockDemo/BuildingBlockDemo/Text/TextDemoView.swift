//
//  TextDemo.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/7/21.
//

import SwiftUI

struct TextDemoView: View {
    @State private var amount: CGFloat = 50
    
    let alignments: [TextAlignment] = [.leading, .center, .trailing]
    @State private var alignment = TextAlignment.leading
    
    var body: some View {
        
        VStack {
            VStack {
//                Picker("Text alignment", selection: $alignment) {
//                    ForEach(alignments, id: \.self) { alignment in
//                        Text(String(describing: alignment))
//                    }
//                }

                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
                    //.font(.custom("Helvetica Neue", size: 25))
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(alignment)
                    .lineLimit(3)
                    .truncationMode(.middle)
                    .lineSpacing(20.0)
                    .padding(.top, 30.0)
                    //.rotationEffect(.degrees(45))
                    //.rotationEffect(.degrees(20), anchor: UnitPoint(x: 0, y: 0))
                    .rotation3DEffect(.degrees(60), axis: (x: 1, y: 0, z: 0))
                    .shadow(color: .gray, radius: 2, x: 0, y: 15)


            }
            
//            VStack {
//                Text("ffi")
//                    .font(.custom("AmericanTypewriter", size: 72))
//                    .kerning(amount)
//                Text("ffi")
//                    .font(.custom("AmericanTypewriter", size: 72))
//                    .tracking(amount)
//
//                Slider(value: $amount, in: 0...100) {
//                    Text("Adjust the amount of spacing")
//                }
//            }
            
//            VStack {
//                // show just the date
//                Text(Date().addingTimeInterval(600), style: .date)
//
//                // show just the time
//                Text(Date().addingTimeInterval(600), style: .time)
//
//                // show the relative distance from now, automatically updating
//                Text(Date().addingTimeInterval(600), style: .relative)
//
//                // make a timer style, automatically updating
//                Text(Date().addingTimeInterval(600), style: .timer)
//            }
            
            VStack {
                Text("Fx Studio")
                  .background(Color.red)
                  .padding()
                
                Text("Fx Studio")
                  .padding()
                  .background(Color.red)
            }
        }
        
    }
}

struct TextDemo_Previews: PreviewProvider {
    static var previews: some View {
        TextDemoView()
    }
}
