//
//  Podcast.swift
//  Podcast
//
//  Created by Baris on 16.05.2023.
//

import Foundation

struct Search: Codable {
    let resultCount : Int
    let results : [Podcast]
}

struct Podcast: Codable {
    var trackName: String?
    var artistName: String
    var trackCount: Int?
    var feedUrl: String?
    var artworkUrl1600: String?
    var feedUrl: String?
}
