//
//  Global.swift
//  iOSCodingChallenge
//
//  Created by Kedar Mohile on 10/22/19.
//  Copyright © 2019 Arti Karnik. All rights reserved.
//

import UIKit

class Global: NSObject
{
    static let sharedInstance = Global()
     var arrMediaType = ["Apple Music","iOS Apps","Audiobooks","Books" , "TV Shows", "Movies", "iTunes U", "Podcasts" , "Music Videos"]

    var arrFeedType = ["coming-soon","new-apps-we-love","top-audiobooks","top-free" , "top-tv-episodes", "top-movies", "top-itunes-u-courses", "top-podcasts" , "top-music-videos"]
       
    var mainMediaURLPart1 :  String =  "https://rss.itunes.apple.com/api/v1/us/"
    var mainMediaURLPart2 :  String =  "/all/10/explicit.json"
}
