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
    
    @State var isActive : Bool = false
    @State var isActive2 : Bool = false
    @State var isActive3 : Bool = false
    
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
                    Button {
                        // goto register view
                    } label: {
//                        NavigationLink(destination: RegisterView(rootIsActive: $isActive),
//                                       isActive: self.$isActive) {
//                            Text("Register a new account")
//                                .frame(maxWidth: .infinity)
//                        }
                        
                        NavigationLink(destination: RegisterView(rootIsActive: $isActive), isActive: self.$isActive3) {
                            Text("Register a new account")
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .buttonStyle(BlueButton())
                    
                    Button {
                        // goto forgot view
                        
                    } label: {
                        NavigationLink(destination: ForgotPasswordView(isHome: true, rootIsActive: self.$isActive2),
                                       isActive: self.$isActive2) {
                            Text("Forgot password")
                                .frame(maxWidth: .infinity)
                        }
                    }
                    .buttonStyle(GrayButton())
                }
                .padding()
            }
            .padding()
            .navigationBarTitleDisplayMode(.inline)
        }
        .environment(\.rootPresentationMode, self.$isActive3)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
