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
    
    //@Binding var selection: Int?
    @Binding var isRootActive: Bool
    @State var isActive = false
    
    @Environment(\.presentationMode) var presentationMode
    
    @State var isAlert = false
    @EnvironmentObject var appRouter: AppRouter
    
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
                        if !username.isEmpty && !password.isEmpty && !passwordConfirm.isEmpty && !email.isEmpty {
                            // goto Home
                            appRouter.state = .tabbar
                        } else {
                            // show error
                            isAlert = true
                        }
                        
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
                    //selection = nil
                    //self.isRootActive = false
                    presentationMode.wrappedValue.dismiss()
                    
                } label: {
                    Text("Login with account")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(BlueButton())
            
                
                NavigationLink(destination: ForgotPasswordView(isRootActive: $isRootActive), isActive: $isActive) {
                    Text("Forgot password")
                        .frame(maxWidth: .infinity)
                }
                .isDetailLink(false)
                .buttonStyle(GrayButton())
            }
            .padding()
        }
        .padding()
        .navigationTitle("Register a new account")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            //isActive = false
        }
        .alert(isPresented: $isAlert) {
            Alert(title: Text("Error"),
                  message: Text("All fields is not empty."),
                  dismissButton: .cancel()
            )
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(isRootActive: .constant(false))
    }
}
