//
//  SwitchingGridLayoutDemo.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 10/7/21.
//

import SwiftUI

struct SwitchingGridLayoutDemo: View {
    
    let photos = (1...30).map { PhotoItem(name: "img\($0%10)") }
    
    @State var gridConfig: [GridItem] = [ GridItem() ] {
        //#5
        didSet {
            switch gridConfig.count {
            case 1:
                icon = "rectangle.grid.2x2"
            case 2:
                icon = "rectangle.grid.3x2"
            case 3:
                icon = "square.grid.4x3.fill"
            case 4:
                icon = "rectangle.grid.1x2"
            default:
                icon = "rectangle.grid.1x2"
            }
        }
    }
    @State var icon: String = "rectangle.grid.2x2"
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridConfig) {
                    ForEach(photos) { item in
                        Image(item.name)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            //#1
                            //.frame(height: 200)
                            //#3
                            .frame(height: gridConfig.count == 1 ? 200 : 100)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                    }
                }
                .padding()
                //#4
                .animation(.interactiveSpring(), value: gridConfig.count)
            }
            .frame(height: .infinity)
            .navigationTitle("Photos")
            //#2
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.gridConfig = Array(repeating: .init(.flexible()), count: self.gridConfig.count % 4 + 1)
                    } label: {
                        Image(systemName: icon)
                            .font(.title)
                            .foregroundColor(.primary)
                    }

                }
            }
        }
    }
}

struct SwitchingGridLayoutDemo_Previews: PreviewProvider {
    static var previews: some View {
        SwitchingGridLayoutDemo()
    }
}
