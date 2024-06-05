//
//  MovieData.swift
//  BSMovieCenter
//
//  Created by BS00834 on 17/5/24.
//

import Foundation

struct MovieData : Codable{
    let status : String
    let status_message : String
    let data : RepoData
}

struct RepoData : Codable {
    let movies : [Movie]
}


