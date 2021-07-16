//
//  View2.swift
//  DemoStateDataFlow
//
//  Created by Tien Le P. VN.Danang on 7/16/21.
//

import SwiftUI

struct PlayerView: View {
    var episode: Episode
    @State private var isPlaying: Bool = false
    
    var body: some View {
        VStack {
            Text(episode.title)
            Text(episode.showTitle)
            PlayButton(isPlaying: $isPlaying) // Pass a binding.
        }
        .background(isPlaying ? Color.green : Color.red) // Transitions with animation.
    }
}

//struct PlayerView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlayerView(episode: Episode(title: "Fx Studio", showTitle: "Hello world!"))
//    }
//}

struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 1)) {
                self.isPlaying.toggle()
            }
        }) {
            Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                .scaleEffect(isPlaying ? 1 : 1.5)
        }
    }
}

struct Podcaster: View {
    @State private var episode = Episode(title: "Some Episode",
                                         showTitle: "Great Show",
                                         isFavorite: false)
    var body: some View {
        VStack {
            Toggle("Favorite", isOn: $episode.isFavorite) // Bind to the Boolean.
            PlayerView(episode: episode)
        }
    }
}

struct Podcaster_Previews: PreviewProvider {
    static var previews: some View {
        Podcaster()
    }
}


struct Episode {
    var title: String
    var showTitle: String
    var isFavorite: Bool
}
