//
//  MultiSelectionWithSelectionManagerDemoView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/21/21.
//

import SwiftUI

struct MultiSelectionWithSelectionManagerDemoView: View {
    var pets = Pet.dummyData()
    
    @State var selectionManager = SelectionManager()
    @State var isEditing = false
    
    var body: some View {
        NavigationView {
            List(pets, selection: $selectionManager.selections) { item in
                Text(item.name)
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
            .navigationBarTitle(Text("Selected \(selectionManager.selections.count) pets"))
        }
    }
}

struct MultiSelectionWithSelectionManagerDemoView_Previews: PreviewProvider {
    static var previews: some View {
        MultiSelectionWithSelectionManagerDemoView()
    }
}
