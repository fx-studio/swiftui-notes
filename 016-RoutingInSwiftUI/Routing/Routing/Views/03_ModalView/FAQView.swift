//
//  FAQView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/13/21.
//

import SwiftUI

struct FAQView: View {
    @State var items = FAQItem.dummyData()
    
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var isPresent: Bool
    
    var body: some View {
        List {
            Section {
                VStack(alignment: .center) {
                    Text("FAQs")
                        .font(.title)
                        .fontWeight(.bold)
                        .italic()
                        .frame(maxWidth: .infinity)
                }
                
            }

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
        .listStyle(InsetListStyle())
        .overlay(
            HStack {
                    Spacer()

                    VStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Image(systemName: "chevron.down.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.accentColor)
                        })
                        .padding(.trailing, 20)
                        .padding(.top, 10)

                        Spacer()
                    }
                }
            )
    }
}

struct FAQView_Previews: PreviewProvider {
    static var previews: some View {
        FAQView(isPresent: .constant(false))
    }
}
