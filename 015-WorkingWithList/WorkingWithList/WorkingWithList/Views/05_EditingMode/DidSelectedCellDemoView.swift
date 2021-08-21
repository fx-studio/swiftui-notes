//
//  DidSelectedCellDemoView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/21/21.
//

import SwiftUI

struct DidSelectedCellDemoView: View {
    
    var weathers = Weather.dummyData()
    @State var selectedItem: String? = nil
    
    var body: some View {
        NavigationView {
            List {
                if #available(iOS 15.0, *) {
                    ForEach(weathers) { item in
                        SelectionCell(title: item.city, selectedItem: $selectedItem) { item in
                            print(item)
                        }
                        .swipeActions(edge: .trailing) {
                            Button {
                                print("Mark as favorite")
                            } label: {
                                Label("Favorite", systemImage: "star")
                            }
                            .tint(.yellow)
                            
                            Button {
                                print("Delete")
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                            .tint(.red)
                        }
                        .swipeActions(edge: .leading) {
                            Button {
                                print("Share")
                            } label: {
                                Label("Share", systemImage: "square.and.arrow.up")
                            }
                            .tint(.green)
                        }
                    }
                    
                } else {
                    // Fallback on earlier versions
                    ForEach(weathers) { item in
                        SelectionCell(title: item.city, selectedItem: $selectedItem) { item in
                            print(item)
                        }
                    }
                }
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Cities")
        }
    }
}

struct DidSelectedCellDemoView_Previews: PreviewProvider {
    static var previews: some View {
        DidSelectedCellDemoView()
    }
}
