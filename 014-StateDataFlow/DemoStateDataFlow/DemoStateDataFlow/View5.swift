//
//  View5.swift
//  DemoStateDataFlow
//
//  Created by Tien Le P. VN.Danang on 7/19/21.
//

import SwiftUI

struct View5: View {
    
    @State var name = "An amazing post!"
    @State var description = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    @State var likeCount = 999999
    @State var commentCount = 999999
    
    var body: some View {
        VStack {
            Image(systemName: "photo.fill")
                .resizable()
                .foregroundColor(Color.blue)
                .frame(height: 200.0)
            Text(name)
                .font(.title)
            Divider()
            Text(description)
            Divider()
            HStack {
                Button(action: {
                    // ahihi
                }, label: {
                    Label(
                        title: { Text("\(likeCount)") },
                        icon: { Image(systemName: "hand.thumbsup.fill") })
                })
                Button(action: {
                    // ahihi
                }, label: {
                    Label(
                        title: { Text("\(commentCount)")},
                        icon: { Image(systemName: "text.bubble.fill") })
                })
                Button(action: {
                    // ahihi
                }, label: {
                    Label(
                        title: { Text("Share") },
                        icon: { Image(systemName: "arrowshape.turn.up.right.fill") })
                })
            }.padding()
        }
        .padding()
    }
}

struct View5_Previews: PreviewProvider {
    static var previews: some View {
        View5()
    }
}
