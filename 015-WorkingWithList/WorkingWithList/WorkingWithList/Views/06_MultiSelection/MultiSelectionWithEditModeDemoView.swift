//
//  MultiSelectionWithEditModeDemoView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/21/21.
//

import SwiftUI

struct MultiSelectionWithEditModeDemoView: View {
    
    var items = ["Alpaca","Ant", "Bird","Cat", "Dog","Ferret","Fish","Frog", "Gecko", "Gerbil", "Goat", "Guinea Pig", "Hamster", "Hedgehog", "Crab", "Horse", "Iguana", "Mantis", "Mouse",  "Newt", "Pig", "Rabbit", "Rat", "Salamander", "Sheep", "Snake", "Spider", "Stick-Bugs", "Turtle"]
    
    @State var selectedRows = Set<String>() // Multipe Selection
    @State var selectedRow: String? // Single Selection
    @State var isEditing = false
    
    var body: some View {
        NavigationView {
            List(items, id: \.self, selection: $selectedRow) { item in
                Text(item)
            }
            .navigationBarItems(trailing: Button(action: {
                // code for action
                isEditing.toggle()
            }, label: {
                if self.isEditing {
                    Text("Done").foregroundColor(Color.red)
                } else {
                    Text("Edit").foregroundColor(Color.blue)
                }
            }))
            .environment(\.editMode, .constant(self.isEditing ? EditMode.active : EditMode.inactive))
            .animation(Animation.spring())
            .listStyle(InsetListStyle())
            .navigationBarTitle(Text("Selected \(selectedRows.count) rows"))
        }
    }
}

struct MultiSelectionWithEditModeDemoView_Previews: PreviewProvider {
    static var previews: some View {
        MultiSelectionWithEditModeDemoView()
    }
}
