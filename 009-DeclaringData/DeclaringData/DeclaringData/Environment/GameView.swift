//
//  GameView.swift
//  DeclaringData
//
//  Created by Le Phuong Tien on 3/16/21.
//

import SwiftUI

struct GameView: View {
    @StateObject var settings = GameSettings()

        var body: some View {
            NavigationView {
                VStack {
                    Text("Score: \(settings.score)")
                        .font(.title)
                    
                    Button(action: {
                        settings.score += 1
                    }, label: {
                        Text("Increase Score")
                            .padding()
                    })

                    NavigationLink(destination: ScoreView()) {
                        Text("Show Detail View")
                            .font(.title)
                    }
                }
                .frame(height: 200)
            }
            .environmentObject(settings)
        }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
