//
//  FAQView.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/9/21.
//

import SwiftUI

struct FAQView: View {
    
    @State var items = FAQItem.dummyData()
    
    var body: some View {
        List {
            ForEach(0..<items.count) { index in
                DisclosureGroup(
                    isExpanded: $items[index].showContent,
                    content: {
                        Text(items[index].answer)
                            .font(.body)
                            .fontWeight(.light)
                    },
                    label: {
                        Text("\(index + 1). \(items[index].question)")
                            .font(.body)
                            .fontWeight(.bold)
                    })
            }
        }
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView()
    }
}
