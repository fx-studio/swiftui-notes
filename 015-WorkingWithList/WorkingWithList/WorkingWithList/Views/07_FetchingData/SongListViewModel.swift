//
//  SongListViewModel.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/22/21.
//

import Foundation
import SwiftUI
import Combine

enum APIError: Error {
    case error(String)
    
    var localizedDescription: String {
        switch self {
        case .error(let message):
            return message
        }
    }
}

enum APIState {
    case loading
    case success
    case failure(APIError)
}

class SongListViewModel: ObservableObject {
    
    private let urlString = "https://rss.itunes.apple.com/api/v1/vn/apple-music/hot-tracks/all/100/explicit.json"
    @Published var songs: [Song] = []
    
    @Published var apiState: APIState = .loading
    
    init() {
        //loadAPI()
    }
    
    //API
    func loadAPI() {
        guard let url = URL(string: urlString) else {
            apiState = .failure(APIError.error("URL Error"))
            return
        }
        
        apiState = .loading
        
        URLSession.shared.dataTask(with: url) { [self] (data, _, _) in
            guard let data = data else {
                self.apiState = .failure(APIError.error("Data Error"))
                return
            }
            
            do {
                let songResult = try JSONDecoder().decode(SongResult.self, from: data)
                DispatchQueue.main.async {
                    self.songs = songResult.feed.results
                    self.apiState = .success
                }
            } catch {
                self.apiState = .failure(APIError.error(error.localizedDescription))
            }
        }.resume()
    }
}
