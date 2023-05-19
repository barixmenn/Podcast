//
//  FavoriteViewModel.swift
//  Podcast
//
//  Created by Baris on 19.05.2023.
//

import Foundation
struct FavoriteViewModel {
    var podcastCoreData: PodcastCoreData!
    init(podcastCoreData: PodcastCoreData!) {
        self.podcastCoreData = podcastCoreData
    }
    var imageUrlPodcast: URL?{
        return URL(string: podcastCoreData.artworkUrl600!)
    }
    var podcastNameLabel: String?{
        return podcastCoreData.trackName
    }
    var podcastArtistName: String?{
        return podcastCoreData.artistName
    }
}
