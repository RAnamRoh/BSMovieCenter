//
//  Movie.swift
//  BSMovieCenter
//
//  Created by BS00834 on 20/5/24.
//

import Foundation

struct Movie : Codable, Hashable {
    let id : Int
    let title : String
    let year : Int
    let rating : Double
    let runtime : Int
    let genres : [String]
    let summary : String
    let background_image : String
    let large_cover_image :  String
    
    
    static var movieExample = Movie(id: 100, title: "Dummy Title", year: 2020, rating: 2.5, runtime: 127, genres: ["Action", "Adventure"], summary: "Hello Darkness My old Friedn", background_image: "background_image_dummy", large_cover_image: "medium_cover_image_dummy")
    
    static var movieArrayExample = [
        Movie(id: 100, title: "Dummy Movie 1", year: 2020, rating: 2.5, runtime: 127, genres: ["Action", "Adventure"], summary: "Hello Darkness My old Friedn", background_image: "background_image_dummy", large_cover_image: "medium_cover_image_dummy"),
        Movie(id: 200, title: "Dummy Movie 2", year: 2020, rating: 2.5, runtime: 127, genres: ["Action", "Adventure"], summary: "Hello Darkness My old Friedn", background_image: "background_image_dummy", large_cover_image: "medium_cover_image_dummy"),
        Movie(id: 300, title: "Dummy Movie 3", year: 2020, rating: 2.5, runtime: 127, genres: ["Action", "Adventure"], summary: "Hello Darkness My old Friedn", background_image: "background_image_dummy", large_cover_image: "medium_cover_image_dummy"),
        Movie(id: 400, title: "Dummy Movie 4", year: 2020, rating: 2.5, runtime: 127, genres: ["Action", "Adventure"], summary: "Hello Darkness My old Friedn", background_image: "background_image_dummy", large_cover_image: "medium_cover_image_dummy"),
        Movie(id: 500, title: "Dummy Movie 5", year: 2020, rating: 2.5, runtime: 127, genres: ["Action", "Adventure"], summary: "Hello Darkness My old Friedn", background_image: "background_image_dummy", large_cover_image: "medium_cover_image_dummy")
    
    
    ]
}
