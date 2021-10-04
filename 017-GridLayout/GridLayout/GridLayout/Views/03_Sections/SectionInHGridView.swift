//
//  SectionInHGridView.swift
//  GridLayout
//
//  Created by Tien Le P. VN.Danang on 10/4/21.
//

import SwiftUI

struct SectionInHGridView: View {
    private var configGridItem = [
        GridItem(.flexible(minimum: 100), spacing: 10),
        GridItem(.flexible(minimum: 100), spacing: 10),
        GridItem(.flexible(minimum: 100), spacing: 10)
    ]
    
    private func customHHeader(with header: String) -> some View {
        Text(header)
          .bold()
          .frame(minWidth: 70)
          .rotationEffect(Angle(degrees: -90))
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background(RoundedRectangle(cornerRadius: 10)
            .fill(Color.headerBackground))
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(
                rows: configGridItem,
                spacing: 10,
                pinnedViews: [.sectionHeaders, .sectionFooters]
            ) {
                Section(header: customHHeader(with: "Section 1")) {
                    ForEach(1...10, id: \.self) { index in
                        Text("1.\(index)")
                            .frame(minWidth: 50, maxHeight: .infinity)
                            .background(Color.random)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10.0)
                            )
                    }
                }
                
                Section(header: customHHeader(with: "Section 2")) {
                    ForEach(11...20, id: \.self) { index in
                        Text("2.\(index)")
                            .frame(minWidth: 50, maxHeight: .infinity)
                            .background(Color.random)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10.0)
                            )
                    }
                }
                
                Section(header: customHHeader(with: "Section 3")) {
                    ForEach(21...30, id: \.self) { index in
                        Text("3.\(index)")
                            .frame(minWidth: 50, maxHeight: .infinity)
                            .background(Color.random)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10.0)
                            )
                    }
                }
                
                Section(header: customHHeader(with: "Section 4")) {
                    ForEach(31...40, id: \.self) { index in
                        Text("4.\(index)")
                            .frame(minWidth: 50, maxHeight: .infinity)
                            .background(Color.random)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 10.0)
                            )
                    }
                }
            }
            .padding()
        }
        .frame(maxHeight: .infinity)
    }
}

struct SectionInHGridView_Previews: PreviewProvider {
    static var previews: some View {
        SectionInHGridView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
