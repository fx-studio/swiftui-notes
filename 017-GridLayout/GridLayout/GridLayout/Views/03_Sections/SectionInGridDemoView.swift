//
//  SectionInGridDemoView.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 10/4/21.
//

import SwiftUI

struct SectionInGridDemoView: View {
    
    private var configGridItem = [
        GridItem(.fixed(100), spacing: 10),
        GridItem(.fixed(100), spacing: 10),
        GridItem(.fixed(100), spacing: 10)
    ]
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(
                columns: configGridItem,
                spacing: 10
                //pinnedViews: [.sectionHeaders, .sectionFooters]
            ) {
                // no section
                /*
                ForEach(1...10, id: \.self) { index in
                    Text("1.\(index)")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.random)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10.0)
                        )
                }
                
                ForEach(11...20, id: \.self) { index in
                    Text("2.\(index)")
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.random)
                        .clipShape(
                            RoundedRectangle(cornerRadius: 10.0)
                        )
                }
                 */

                // with Section
                Section(header: Text("Section 1").font(.title)) {
                //Section {
                    ForEach(1...10, id: \.self) { index in
                        Text("1.\(index)")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.random)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10.0)
                            )
                    }
                }
                
                Section(header: Text("Section 2").font(.title)) {
                //Section {
                    ForEach(11...20, id: \.self) { index in
                        Text("2.\(index)")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.random)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10.0)
                            )
                    }
                }
            }
            .padding(.horizontal)
        }
        .frame(maxHeight: .infinity)
    }
}

struct SectionInGridDemoView_Previews: PreviewProvider {
    static var previews: some View {
        SectionInGridDemoView()
    }
}
