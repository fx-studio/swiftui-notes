//
//  ContentView.swift
//  DemoGameTappy00
//
//  Created by lephuongtien on 4/5/21.
//

import SwiftUI
import Combine
import Game

struct ContentView: View {
    
    //@EnvironmentObject var defaults: UserDefaults
    //@State var autoWin: Bool = false
    
    @StateObject var settings = UserSettings()
    @AppStorage("auto_win") var autoWin: Bool = false
        
    init() {
       
    }
    
    var body: some View {
        VStack {
            GameView(width: .infinity)
                .border(autoWin ? Color.blue : Color.red, width: 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.fixed(width: 500, height: 300.0))
            .environment(\.sizeCategory, .small)
            //.environmentObject(UserDefaults.standard)
    }
}


// MARK: Exts
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

extension UserDefaults: ObservableObject {
    @objc dynamic var autoWin: Bool {
        return bool(forKey: "auto_win")
    }
}

class UserSettings: ObservableObject {
    @Published var autoWin: Bool {
        didSet {
            UserDefaults.standard.set(autoWin, forKey: "auto_win")
        }
    }
        
    init() {
        self.autoWin = UserDefaults.standard.object(forKey: "auto_win") as? Bool ?? false
    }
}
