//
//  Enums.swift
//  BSMovieCenter
//
//  Created by BS00834 on 3/6/24.
//

import Foundation


enum SortMovieBy : String, CaseIterable, Identifiable {
    case title = "title"
    case year = "year"
    case rating = "rating"
    var id: String { self.rawValue }
}

enum MovieQuality : String, CaseIterable {
   
    case p2160 = "2160p"
    case p1080 = "1080p"
    case p720 = "720p"
    case p480 = "480p"
    case _3D = "3D"
    
}

enum MovieGenre : String, CaseIterable, Identifiable{
    case action = "Action"
    case comedy = "Comedy"
    case drama = "Drama"
    case horror = "Horror"
    case thriller = "Thriller"
    case romance = "Romance"
    case sciFi = "Sci-Fi"
    case fantasy = "Fantasy"
    case documentary = "Documentary"
    case animation = "Animation"
    
    var id: String { self.rawValue }
}
