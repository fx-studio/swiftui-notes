//
//  MultiSelectionWithEditButtonDemoView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/21/21.
//

import SwiftUI

struct MultiSelectionWithEditButtonDemoView: View {
    
    var items = ["Alpaca","Ant", "Bird","Cat", "Dog","Ferret","Fish","Frog", "Gecko", "Gerbil", "Goat", "Guinea Pig", "Hamster", "Hedgehog", "Crab", "Horse", "Iguana", "Mantis", "Mouse",  "Newt", "Pig", "Rabbit", "Rat", "Salamander", "Sheep", "Snake", "Spider", "Stick-Bugs", "Turtle"]
    
    @State var selectedRows = Set<String>()
    
    var body: some View {
        NavigationView {
            List(items, id: \.self, selection: $selectedRows) { item in
                Text(item)
            }
            .navigationBarItems(trailing: EditButton())
            .listStyle(InsetListStyle())
            .navigationBarTitle(Text("Selected \(selectedRows.count) rows"))
        }
    }
}

struct MultiSelectionWithEditButtonDemoView_Previews: PreviewProvider {
    static var previews: some View {
        MultiSelectionWithEditButtonDemoView()
    }
}
