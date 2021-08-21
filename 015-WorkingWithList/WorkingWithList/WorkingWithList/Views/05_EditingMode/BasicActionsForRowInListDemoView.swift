//
//  BasicActionsForRowInListDemoView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/21/21.
//

import SwiftUI

struct BasicActionsForRowInListDemoView: View {
    @State var weathers = Weather.dummyData()
    @State var isEditing = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(weathers) { item in
                    Text(item.city)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
            }
            .listStyle(InsetListStyle())
            .navigationBarItems(leading: Button(action: add, label: {
                Text("Add")
            }))
            //.navigationBarItems(trailing: EditButton())
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
            .navigationTitle("Cities")
        }
    }
    
    func delete(at offsets: IndexSet) {
        if let first = offsets.first {
            weathers.remove(at: first)
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        let reversedSource = source.sorted()
        for index in reversedSource.reversed() {
            weathers.insert(weathers.remove(at: index), at: destination)
        }
    }
    
    func add() {
        let item = Weather(city: "new city", country: "new country", temperature: 25, status: .sun)
        weathers.append(item)
    }
}

struct BasicActionsForRowInListDemoView_Previews: PreviewProvider {
    static var previews: some View {
        BasicActionsForRowInListDemoView()
    }
}
