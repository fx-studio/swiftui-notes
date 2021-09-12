//
//  ForgotPasswordView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/12/21.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email: String = ""
    
    // #1
    @Environment(\.presentationMode) var presentation
    // #2
    @Binding var rootIsActive : Bool
    // #3
    @Environment(\.rootPresentationMode) private var rootPresentationMode
    
    var isHome: Bool
    init(isHome: Bool = false, rootIsActive: Binding<Bool>) {
        self.isHome = isHome
        self._rootIsActive = rootIsActive
    }
    
    var body: some View {
        VStack {
            // TextField
            VStack {
                TextField("email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button {
                    // goto register view
                } label: {
                    Text("Send email")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(BlueButton())
            }
            .padding()
            // Others button
            Spacer()
            VStack {
                Button {
                    // goto login view
                    // #1
                    //presentation.wrappedValue.dismiss()
                    
                    if isHome {
                        // #2
                        self.rootIsActive = false
                    } else {
                        // #3
                        rootPresentationMode.wrappedValue.dismiss()
                    }
                    
                } label: {
                    Text("Goto Login")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(GrayButton())
            }
            .padding()
        }
        .padding()
        .navigationTitle("Forgot password")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(rootIsActive: .constant(false))
    }
}
