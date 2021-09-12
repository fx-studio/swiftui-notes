//
//  RegisterView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/12/21.
//

import SwiftUI

struct RegisterView: View {
    @State var username: String = ""
    @State var email: String = ""
    @State var password: String = ""
    @State var passwordConfirm: String = ""
    
    // #1
    @Environment(\.presentationMode) var presentation
    // #2
    @Binding var rootIsActive : Bool
    // #3
    @Environment(\.rootPresentationMode) private var rootPresentationMode
    
    var body: some View {
        VStack {
            // TextField
            VStack {
                TextField("username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                SecureField("password confirm", text: $passwordConfirm)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Button {
                        // goto Home
                    } label: {
                        Text("Done")
                    }
                    .buttonStyle(BlueButton())
                    
                    Button {
                        // clear
                        username = ""
                        email = ""
                        password = ""
                        passwordConfirm = ""
                    } label: {
                        Text("Clear")
                    }
                    .buttonStyle(GrayButton())
                }
            }
            .padding()
            // Others button
            Spacer()
            VStack {
                Button {
                    // goto register view
                    // #1
                    // presentation.wrappedValue.dismiss()
                    
                    // #2
                    //self.rootIsActive = false
                    
                    // #3
                    rootPresentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Login with account")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(BlueButton())
                
                Button {
                    // goto forgot view
                } label: {
                    NavigationLink(destination: ForgotPasswordView(rootIsActive: self.$rootIsActive)) {
                        Text("Forgot password")
                            .frame(maxWidth: .infinity)
                    }
                }
                .buttonStyle(GrayButton())
            }
            .padding()
        }
        .padding()
        .navigationTitle("Register a new account")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(rootIsActive: .constant(false))
    }
}
