//
//  Movie.swift
//  SwiftyMovie
//
//  Created by Thomas Nyuma on 12/25/22.
//

import Foundation
import UIKit

struct Movie {
    let adult: Bool
    let backdrop_path: String
    let id: Int
    let original_language:   String
    let overview: String
    let popularity: Float
    let poster_path:String
    let release_date:String
    let title:String
    let video:  Bool
    let vote_average:Float
    let vote_count: Float
    var is_favorite=false
}

extension Movie: Decodable {
    enum CodingKeys: String, CodingKey {
       case adult
       case backdrop_path
       case id
       case original_language
       case overview
       case popularity
       case poster_path
       case release_date
       case title
       case video
       case vote_average
       case vote_count

    }
}

