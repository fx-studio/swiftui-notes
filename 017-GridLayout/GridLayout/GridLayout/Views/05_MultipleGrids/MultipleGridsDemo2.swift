//
//  MultipleGridsDemo2.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 10/12/21.
//

import SwiftUI

struct MultipleGridsDemo2: View {
    
    let menus = MenuItem.dummyData()
    @State var gridConfig: [GridItem] = [GridItem()]
    
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridConfig) {
                    ForEach(menus) { menu in
                        
                        //#1
                        Image(menu.thumbnail)
                            .resizable()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .scaledToFill()
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        
                        //#2
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                            ForEach(menu.photos) { photo in
                                Image(photo.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 50)
                                    .cornerRadius(10)
                            }
                        }
                        .frame(minHeight: 0, maxHeight: .infinity, alignment: .top)
                    }
                }
                .padding(10)
            }
            .navigationTitle("Thực đơn")
        }
        .onAppear(perform: {
            if verticalSizeClass == .regular {
                self.gridConfig = [
                    GridItem(.adaptive(minimum:  verticalSizeClass == .regular  ? 250 : 100)),
                    GridItem(.flexible())
                ]
            } else {
                self.gridConfig = [
                    GridItem()
                ]
            }
        })
        .onChange(of: verticalSizeClass) { newValue in
            if verticalSizeClass == .regular {
                self.gridConfig = [
                    GridItem(.adaptive(minimum:  verticalSizeClass == .regular  ? 250 : 100)),
                    GridItem(.flexible())
                ]
            } else {
                self.gridConfig = [
                    GridItem()
                ]
            }
        }
    }
}

struct MultipleGridsDemo2_Previews: PreviewProvider {
    static var previews: some View {
        MultipleGridsDemo2()
    }
}
