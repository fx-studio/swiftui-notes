//
//  View8.swift
//  DemoStateDataFlow
//
//  Created by Tien Le P. VN.Danang on 7/31/21.
//

import SwiftUI
import Combine

struct View8: View {
    
    @State var isOkay: Bool
    @ObservedObject var settings = UserSettings()
    
    init() {
        isOkay = UserDefaults.standard.bool(forKey: "ahihi")
    }
    
    var body: some View {
        //        VStack {
        //            Toggle(isOn: $isOkay, label: {
        //                Text("Ahihi!")
        //            })
        //            .padding()
        //            Button(action: {
        //                UserDefaults.standard.setValue(!isOkay, forKey: "ahihi")
        //                isOkay = UserDefaults.standard.bool(forKey: "ahihi")
        //            }, label: {
        //                Text("Change")
        //            })
        //        }
        VStack {
            Toggle(isOn: $settings.showOnStart) {
                Text("Show welcome text")
            }
            if settings.showOnStart{
                Text("Welcome")
            }
        }
    }
}

struct View8_Previews: PreviewProvider {
    static var previews: some View {
        View8()
    }
}

//MARK: - Custom UserDefaults
@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T
    
    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

final class UserSettings: ObservableObject {
    
    let objectWillChange = PassthroughSubject<Void, Never>()
    
    @UserDefault("ShowOnStart", defaultValue: true)
    var showOnStart: Bool {
        willSet {
            objectWillChange.send()
        }
    }
}
