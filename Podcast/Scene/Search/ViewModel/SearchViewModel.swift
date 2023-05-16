//
//  SearchViewModel.swift
//  Podcast
//
//  Created by Baris on 16.05.2023.
//

import Foundation

struct SearchViewModel {
    
    //MARK: - Properties
    var podcast: Podcast
    
    //MARK: - Lifecycle
    init(podcast: Podcast) {
        self.podcast = podcast
    }
   
    var photoImageUrl: URL? {
        return URL(string: podcast.artworkUrl600 ?? "")
    }
    
    var trackCountString : String? {
        return "\(podcast.trackCount ?? 0) "
    }
    
    var artistName: String? {
        return podcast.artistName
    }
    
    var trackName: String? {
        return podcast.trackName
    }
}
