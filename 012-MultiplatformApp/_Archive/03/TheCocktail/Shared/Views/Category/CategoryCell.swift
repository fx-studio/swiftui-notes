//
//  CategoryCell.swift
//  TheCocktail
//
//  Created by lephuongtien on 4/27/21.
//

import SwiftUI

struct CategoryCell: View {
    var item: Category
    var color = Color.black.opacity(0.5)
    @State var isActive = false
    
    init( item: Category) {
        self.item = item
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(item.thumbnail)
                .resizable()
                .frame(maxWidth: .infinity, minHeight: 100.0, maxHeight: 200.0)
                .clipped()
            Text(item.name)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 5.0)
                .font(.title)
                .background(color)
                .foregroundColor(Color.white)
        }
        .clipShape(RoundedRectangle(cornerRadius: 10.0))
        .background(
            NavigationLink(
                destination: CategoryDetailView(name: item.name),
                isActive: $isActive,
                label: {
                    EmptyView()
                })
        )
        .onTapGesture {
            self.isActive.toggle()
        }
    }
}

struct CategoryCell_Previews: PreviewProvider {
    static var item = Category(name: "ABC", thumbnail: "img1")
    static var previews: some View {
        CategoryCell(item: item)
    }
}
