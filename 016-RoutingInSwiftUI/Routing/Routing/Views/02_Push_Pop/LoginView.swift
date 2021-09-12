//
//  LoginView.swift
//  Routing
//
//  Created by Tien Le P. VN.Danang on 9/12/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    @State var isActive1 = false
    @State var isActive2 = false
    @State var selection: Int?
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                // logo
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                    VStack(alignment: .leading) {
                        Text("Fx Studio")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text("write the code change the world")
                            .fontWeight(.thin)
                            .italic()
                    }
                }
                
                // TextField
                VStack {
                    TextField("username", text: $username)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    HStack {
                        Button {
                            // goto Home
                        } label: {
                            Text("Login")
                        }
                        .buttonStyle(BlueButton())
                        
                        Button {
                            // clear
                            username = ""
                            password = ""
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

                    // #1
                    NavigationLink(destination: RegisterView(isRootActive: $isActive1), isActive: $isActive1) {
                        Text("Register a new account")
                            .frame(maxWidth: .infinity)
                    }
                    .isDetailLink(false)
                    .buttonStyle(BlueButton())
                    
                    // #2
                    Button {
                        // goto forgot view
                        
                    } label: {
                        NavigationLink(destination: ForgotPasswordView(isRootActive: $isActive2), isActive: $isActive2) {
                            Text("Forgot password")
                                .frame(maxWidth: .infinity)
                        }
                        .isDetailLink(false)
                    }
                    .buttonStyle(GrayButton())
                    
                    // #3
                    /*
                    NavigationLink(destination: RegisterView(selection: $selection), tag: 1, selection: self.$selection) {
                        Text("Register a new account")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(BlueButton())
                    
                    NavigationLink(destination: ForgotPasswordView(selection: $selection), tag: 2, selection: self.$selection) {
                        Text("Forgot password")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(GrayButton())
                    */
                    
                }
                .padding()
                
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
