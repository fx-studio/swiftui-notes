//
//  View6.swift
//  DemoStateDataFlow
//
//  Created by Tien Le P. VN.Danang on 7/24/21.
//

import SwiftUI

struct View6: View {
    
    @EnvironmentObject var userProfile: UserProfile
    @EnvironmentObject var settings: Settings
    
    static var numberFormater: NumberFormatter {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        return nf
    }
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("User informations")
                        .fontWeight(.bold)
                    HStack {
                        Text("Name")
                        TextField("name", text: $userProfile.name)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    HStack {
                        Text("Email")
                        TextField("email", text: $userProfile.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    HStack {
                        Text("Age")
                        TextField("Age",
                                  value: $userProfile.age,
                                  formatter: View6.numberFormater)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                    HStack {
                        Text("Gender")
                        Toggle("Gender", isOn: $userProfile.gender)
                            .labelsHidden()
                        Spacer()
                    }
                    NavigationLink(destination: ProfileView()) {
                        Text("View Profile")
                    }
                    Divider()
                }
                VStack {
                    Text("Settings")
                        .fontWeight(.bold)
                    HStack {
                        Text("Push notification:")
                        Toggle("Push notification", isOn: $settings.onPush)
                            .labelsHidden()
                        Spacer()
                    }
                    HStack {
                        Text("Language")
                        TextField("language", text: $settings.language)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                    }
                }
                .padding()
            }
            .padding()
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
        
    }
}

struct ProfileView: View {
    
    @EnvironmentObject var userProfile: UserProfile
    
    var body: some View {
        VStack {
            Text(userProfile.name)
                .font(.title)
            Text(userProfile.email)
                .font(.body)
                .fontWeight(.thin)
            Text("\(userProfile.age)")
                .font(.body)
                .fontWeight(.thin)
            Text(userProfile.gender ? "male" : "female")
                .font(.body)
                .fontWeight(.thin)
            Spacer()
        }
        .padding()
        .navigationTitle("Profile")
    }
}

struct View6_Previews: PreviewProvider {
    static var previews: some View {
        View6()
            .environmentObject(UserProfile(name: "Fx",
                                           email: "fxstudio@mail.com",
                                           age: 19,
                                           gender: true))
            .environmentObject(Settings())
    }
}

// MARK: - Define
class UserProfile: ObservableObject {
    @Published var name: String
    @Published var email: String
    @Published var age: Int
    @Published var gender: Bool
    
    init(name: String, email: String, age: Int, gender: Bool) {
        self.name = name
        self.email = email
        self.age = age
        self.gender = gender
    }
}

class Settings: ObservableObject {
    @Published var onPush: Bool = true
    @Published var language: String = "Vietnamese"
}
