//
//  GameView.swift
//  DemoGameTappy00
//
//  Created by lephuongtien on 4/5/21.
//

import SwiftUI
import Combine

public enum GameState {
    case loading
    case running
    case gameover
    case winner
}

public struct GameView: View {
    
    @State var backgroundColor = Color(.darkGray)
    let mainColor = Color(.white)
    public var width: CGFloat
    
    @State var gameState: GameState = .loading
    
    @State var status = "Tap to Play!"
    @State var isStarGame = false
    @State var count = 10
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common)
    @State private var timerSubscription: Cancellable?
    
    var isWatchOS: Bool
        
    public init(width: CGFloat = 300.0, isWatchOS: Bool = false) {
        self.width = width
        self.isWatchOS = isWatchOS
    }
    
    public var body: some View {
        ZStack {
            Rectangle()
                .fill(backgroundColor)
                .frame(width: width, height: width)
                .onTapGesture {
                    handleTap()
                }
            makeStatusView()
        }
        // Timer handel
        .onReceive(timer, perform: { _ in
            if count == 0 {
                count = 10
            } else {
                count -= 1
            }
        })
        .frame(width: width, height: width, alignment: .center)
        .background(backgroundColor)
    }
    
    @ViewBuilder func makeStatusView() -> some View {
        switch gameState {
        case .loading:
            ZStack {
                Rectangle()
                    .fill(backgroundColor)
                    .frame(width: width, height: width)
                VStack {
                    Spacer()
                    Text("Tapp 00")
                        .font(.largeTitle)
                        .foregroundColor(mainColor)
                        .padding()
                    Spacer()
                    Button(action: {
                        handleTap()
                    }, label: {
                        Text("Play")
                            .font(.title)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(backgroundColor)
                            .padding()
                    })
                    .background(mainColor)
                }
                .padding()
            }
            
        case .running:
            Text(makeCount())
                .font(.system(size: 70))
                .multilineTextAlignment(.center)
                .foregroundColor(mainColor)
                .onTapGesture {
                    handleTap()
                }
            
        case .gameover, .winner:
            ZStack {
                Rectangle()
                    .fill(backgroundColor)
                    .frame(width: width, height: width)
                VStack {
                    Spacer()
                    Text(status)
                        .font(isWatchOS ? .body : .largeTitle)
                        .foregroundColor(mainColor)
                    Text("You tappy : \(makeCount())")
                        .fontWeight(.bold)
                        .foregroundColor(mainColor)
                        .padding()
                    Spacer()
                    Button(action: {
                        handleTap()
                    }, label: {
                        Text("Play again")
                            .font(isWatchOS ? .body : .largeTitle)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(backgroundColor)
                            .padding()
                    })
                    .background(mainColor)
                }
                .padding()
            }
        }
    }
    
    //MARK: Action
    func handleTap() {
        isStarGame.toggle()
        
        if isStarGame {
            count = 10
            instantiateTimer()
            self.gameState = .running
            self.backgroundColor = Color(.darkGray)
            
        } else {
            cancelTimer()
            
            if UserDefaults.standard.bool(forKey: "auto_win") {
                
                self.backgroundColor = Color(.blue)
                self.status = "You win!"
                self.gameState = .winner
                
            } else {
                if count != 0 {
                    self.backgroundColor = Color(.red)
                    self.status = "Game over!"
                    self.gameState = .gameover
                } else {
                    self.backgroundColor = Color(.blue)
                    self.status = "You win!"
                    self.gameState = .winner
                }
            }

        }
    }
    
    func makeCount() -> String {
        (count < 10) ? "0\(count)" : "\(count)"
    }
    
    //MARK: TIMER
    func instantiateTimer() {
        self.timer = Timer.publish (every: 0.01, on: .main, in: .common)
        self.timerSubscription = self.timer.connect()
    }
    
    func cancelTimer() {
        self.timerSubscription?.cancel()
        self.timerSubscription = nil
    }
}

//struct GameView_Previews: PreviewProvider {
//    static var previews: some View {
//        GameView(width: 300.0)
//            .previewLayout(.fixed(width: 300.0, height: 300.0))
//    }
//}
