//
//  UserCell.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/4/21.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .resizable()
                .foregroundColor(Color.orange)
                .frame(width: 60, height: 60, alignment: .center)
                .padding(.all)
            VStack(alignment: .leading) {
                Text("Noname")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                    Text("Da Nang, Viet Nam")
                        .fontWeight(.light)
            }
            Spacer()
            Image(systemName: "info.circle")
                .foregroundColor(Color.orange)
                .padding(.all)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
