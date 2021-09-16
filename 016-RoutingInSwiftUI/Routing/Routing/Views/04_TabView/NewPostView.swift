//
//  NewPostView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/15/21.
//

import SwiftUI

struct NewPostView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Add a new post")
                .font(.largeTitle)
            Divider()
            Button {
                dismiss()
            } label: {
                Text("Dismiss")
            }

        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
