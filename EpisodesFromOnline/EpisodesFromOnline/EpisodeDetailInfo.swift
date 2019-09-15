//
//  EpisodeDetailInfo.swift
//  EpisodesFromOnline
//
//  Created by Pursuit on 9/14/19.
//

import Foundation

struct EpisodeDetailInfo : Codable {
    let id : Int
    let name: String
    let season: Int
    let image : ImageInfo?
    let summary: String 
}

