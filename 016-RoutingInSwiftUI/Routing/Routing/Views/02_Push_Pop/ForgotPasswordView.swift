//
//  ForgotPasswordView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/12/21.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var email: String = ""
    
    //@Binding var selection: Int?
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var isRootActive: Bool
    
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
                    //presentationMode.wrappedValue.dismiss()
                    
                    isRootActive = false
                    
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
        ForgotPasswordView(isRootActive: .constant(false))
    }
}
