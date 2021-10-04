//
//  CustomHeaderInGridView.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 10/4/21.
//

import SwiftUI

struct CustomHeaderInGridView: View {
    private var configGridItem = [
        GridItem(.fixed(100), spacing: 10),
        GridItem(.fixed(100), spacing: 10),
        GridItem(.fixed(100), spacing: 10)
    ]
    
    private func customVHeader(with header: String) -> some View {
      Text(header)
        .font(.title2)
        .bold()
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 10)
          .fill(Color.headerBackground))
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVGrid(
                columns: configGridItem,
                spacing: 10,
                pinnedViews: .sectionHeaders
            ) {
                Section(header: customVHeader(with: "Section 1")) {
                    ForEach(1...10, id: \.self) { index in
                        Text("1.\(index)")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.random)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10.0)
                            )
                    }
                }
                
                Section(header: customVHeader(with: "Section 2")) {
                    ForEach(11...20, id: \.self) { index in
                        Text("2.\(index)")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.random)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10.0)
                            )
                    }
                }
                
                Section(header: customVHeader(with: "Section 3")) {
                    ForEach(21...30, id: \.self) { index in
                        Text("3.\(index)")
                            .frame(maxWidth: .infinity, minHeight: 50)
                            .background(Color.random)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10.0)
                            )
                    }
                }
                
                Section(header: customVHeader(with: "Section 4")) {
                    ForEach(31...40, id: \.self) { index in
                        Text("4.\(index)")
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

struct CustomHeaderInGridView_Previews: PreviewProvider {
    static var previews: some View {
        CustomHeaderInGridView()
    }
}
