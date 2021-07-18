//
//  View3.swift
//  DemoStateDataFlow
//
//  Created by Tien Le P. VN.Danang on 7/18/21.
//

import SwiftUI

struct MyMoviesView: View {
    @StateObject var movies = Movies()
    
    var body: some View {
        VStack {
            Text("My Movies")
                .italic()
                .bold()
                .font(.title)
            ForEach(movies.list) { movie in
                MovieView(movie: movie)
            }
        }.padding()
    }
}

struct MovieView: View {
    @ObservedObject var movie: Movie
    
    var body: some View {
        HStack {
            Text(movie.name)
                .font(.body)
                .fontWeight(.bold)
            Spacer()
            Toggle(isOn: $movie.watched, label: {
                EmptyView()
            })
        }.padding()
    }
}

// MARK: - Preview
struct MyMoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MyMoviesView()
    }
}

// MARK: - Models
class Movie: ObservableObject, Identifiable {
    
    var id = UUID()
    
    @Published var name: String
    @Published var watched: Bool
    
    init(name: String, watched: Bool = false) {
        self.name = name
        self.watched = watched
    }
}

extension Movie {
    static func myMovies() -> [Movie] {
        [
            Movie(name: "Iron main", watched: true),
            Movie(name: "Black widow", watched: true),
            Movie(name: "Hulk", watched: false),
            Movie(name: "Captain Marvel", watched: false),
            Movie(name: "Loki", watched: true)
        ]
    }
}

class Movies: ObservableObject {
    @Published var list: [Movie]
    
    init() {
        list = Movie.myMovies()
    }
}
