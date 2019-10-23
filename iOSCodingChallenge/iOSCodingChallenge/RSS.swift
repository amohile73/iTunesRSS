//
//  RSS.swift
//  iOSCodingChallenge
//
//  Created by Kedar Mohile on 10/22/19.
//  Copyright © 2019 Arti Karnik. All rights reserved.
//

import UIKit

// MARK: - RSSFeed
    struct RSS :  Codable
    {
        let feed: Feed
    }
    // MARK: - Feed
    struct Feed: Codable {
        let title: String
      
        let results: [Result]
    }
    // MARK: - Result
    struct Result: Codable
    {
        let artistName, releaseDate, name: String
        let artworkUrl100: String
      
        enum CodingKeys: String, CodingKey {
            case artistName, name,releaseDate
            case artworkUrl100
        }
    }
    
    

