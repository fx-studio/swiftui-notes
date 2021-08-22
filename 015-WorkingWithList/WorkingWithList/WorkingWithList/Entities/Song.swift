//
//  Song.swift
//  WorkingWithList
//
//  Created by Tien Le P. VN.Danang on 8/22/21.
//

import Foundation
import SwiftUI
import Combine

typealias APIModel = Decodable & Identifiable

struct Song: APIModel {
    var id: String
    var artistName: String
    var releaseDate: String
    var name: String
    var collectionName: String
    var kind: String
    var copyright: String
    var artistId: String
    var artistUrl: String
    var artworkUrl100: String
}

//MARK: - Result
struct SongFeed: Decodable {
    var results: [Song]
}

struct SongResult: Decodable {
    var feed: SongFeed
}
