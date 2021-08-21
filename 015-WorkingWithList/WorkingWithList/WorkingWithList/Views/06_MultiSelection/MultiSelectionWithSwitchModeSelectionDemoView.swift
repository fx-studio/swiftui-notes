//
//  MultiSelectionWithSwitchModeSelectionDemoView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/21/21.
//

import SwiftUI

struct MultiSelectionWithSwitchModeSelectionDemoView: View {
    
    var pets = Pet.dummyData()
    
    @State var selectionManager = SelectionManager()
    @State var isMultiSelection = true
    
    var body: some View {
        NavigationView {
            List(pets) { pet in
                SuperMultiSelectRow(pet: pet, selectionManager: self.$selectionManager)
            }
            .navigationBarItems(leading: Button(action: {
                // code for change select mode
                isMultiSelection.toggle()
                self.selectionManager.allowsMultipleSelection = self.isMultiSelection
            }, label: {
                if self.isMultiSelection {
                    Text("Multi-Select").foregroundColor(Color.blue)
                } else {
                    Text("Single-Select").foregroundColor(Color.red)
                }
            }))
            .listStyle(InsetListStyle())
            .navigationBarTitle(Text("Selected \(selectionManager.selections.count) rows"))
        }
    }
}

struct MultiSelectionWithSwitchModeSelectionDemoView_Previews: PreviewProvider {
    static var previews: some View {
        MultiSelectionWithSwitchModeSelectionDemoView()
    }
}
