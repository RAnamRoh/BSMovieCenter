//
//  MovieDetail.swift
//  BSMovieCenter
//
//  Created by BS00834 on 23/5/24.
//

import Foundation

struct MovieDetail : Codable{
    let status : String
    let status_message : String
    let data : MovieObject
}

struct MovieObject : Codable {
    let movie : Movie
}

