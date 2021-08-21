//
//  MultiSelectionWithCustomRow.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/21/21.
//

import SwiftUI

struct MultiSelectionWithCustomRowDemoView: View {
    var pets = Pet.dummyData()
    
    @State var selectedRows = Set<UUID>()
    
    var body: some View {
        NavigationView {
            List(pets) { pet in
                MultiSelectRow(pet: pet, selectedItems: self.$selectedRows)
            }
            .listStyle(InsetListStyle())
            .navigationBarTitle(Text("Selected \(selectedRows.count) rows"))
        }
    }
}

struct MultiSelectionWithCustomRow_Previews: PreviewProvider {
    static var previews: some View {
        MultiSelectionWithCustomRowDemoView()
    }
}
