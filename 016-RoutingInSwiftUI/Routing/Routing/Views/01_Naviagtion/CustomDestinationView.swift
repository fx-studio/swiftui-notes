//
//  CustomDestinationView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/10/21.
//

import SwiftUI

struct CustomDestinationView: View {
    var body: some View {
        VStack {
            Image(systemName: "lasso.sparkles")
                .font(.largeTitle)
            Text("Lasso of Truth")
                .font(.headline)
            Text("The Lasso of Truth is a weapon wielded by DC Comics superhero Wonder Woman, Princess Diana of Themyscira. It is also known as the Magic Lasso or the Lasso of Hestia.")
                .font(.body)
        }
        .navigationTitle("Lasso of Truth") // <1>
    }
}

struct CustomDestinationView_Previews: PreviewProvider {
    static var previews: some View {
        CustomDestinationView()
    }
}
