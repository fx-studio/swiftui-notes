//
//  DemoLoginView.swift
//  BuildingBlockDemo
//
//  Created by lephuongtien on 5/20/21.
//

import SwiftUI

struct DemoLoginView: View {
    
    // MARK: Properties
    @State var username: String = ""
    @State var password: String = ""
    
    @StateObject var viewmodel = DemoLoginViewModel()

    // MARK: Body
    var body: some View {
        VStack {
            // Welcome
            HStack(alignment: .center) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                    .padding()
                VStack(alignment: .leading) {
                    Text("Welcome to")
                        .font(.headline)
                    Text("Fx Studio")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .padding(.trailing)
            }
            
            // TextFields
            VStack {
                Text("Login with your account.")
                    .italic()
                TextField("Username", text: $viewmodel.username)
                    .kute()
                SecureField("Password", text: $viewmodel.password)
                    .kute()
                
            }
            
            // Toggle
            HStack {
                Spacer()
                Toggle(isOn: $viewmodel.rememberUser) {
                    Text("Remember me")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .fixedSize()
            }
            .padding(.bottom, 20.0)

            // Buttons
            HStack {
                Button(action: viewmodel.login, label: {
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                .kuteButton(isDisabled: !viewmodel.checkValid())
                .disabled(!viewmodel.checkValid())

                Button(action: viewmodel.reset, label: {
                    Text("Clear")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                })
                .kuteButton()
            }
        }
        .padding()
        .alert(isPresented: $viewmodel.alert, content: {
            Alert(title: Text(viewmodel.isLogined ? "Fx Studio" : "Error"),
                  message: Text(viewmodel.message),
                  dismissButton: .default(Text("Got it!"))
            )
        })
    }
    
    //MARK: Actions
    func login() {
        // ahihi
    }
    
    func clear() {
        username = ""
        password = ""
    }
}

struct DemoLoginView_Previews: PreviewProvider {
    static var previews: some View {
        DemoLoginView()
    }
}
