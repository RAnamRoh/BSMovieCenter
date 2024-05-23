//
//  Movie.swift
//  BSMovieCenter
//
//  Created by BS00834 on 20/5/24.
//

import Foundation

struct Movie : Codable, Hashable{
   
    
    let id : Int
    let title : String
    let year : Int
    let rating : Double
    let runtime : Int
    let genres : [String]
    let summary : String
    let background_image : String
    let large_cover_image :  String
    let cast : [Cast]?
    
    static var movieExample = Movie(id: 100, title: "Dummy Title", year: 2020, rating: 8.7, runtime: 127, genres: ["Action", "Adventure"], summary: "Hello Darkness My old Friedn, I wanna talk to you again, whent the time will come. Dont be afraid, people are not afraid to be alone, they are afraid of being not alone in the dark", background_image: "background_image_dummy", large_cover_image: "medium_cover_image_dummy", cast: [Cast.castExample,Cast.castExample])
    
    static var movieArrayExample = [
        Movie(id: 100, title: "Dummy Title", year: 2020, rating: 8.7, runtime: 127, genres: ["Action", "Adventure"], summary: "Hello Darkness My old Friedn, I wanna talk to you again, whent the time will come. Dont be afraid, people are not afraid to be alone, they are afraid of being not alone in the dark", background_image: "background_image_dummy", large_cover_image: "medium_cover_image_dummy", cast: [Cast.castExample,Cast.castExample]),
        Movie(id: 100, title: "Dummy Title", year: 2020, rating: 8.7, runtime: 127, genres: ["Action", "Adventure"], summary: "Hello Darkness My old Friedn, I wanna talk to you again, whent the time will come. Dont be afraid, people are not afraid to be alone, they are afraid of being not alone in the dark", background_image: "background_image_dummy", large_cover_image: "medium_cover_image_dummy", cast: [Cast.castExample,Cast.castExample])
    
    
    ]
}
