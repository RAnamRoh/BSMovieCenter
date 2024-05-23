//
//  Cast.swift
//  BSMovieCenter
//
//  Created by BS00834 on 23/5/24.
//

import Foundation

struct Cast : Codable , Hashable{
    let name : String
    let character_name : String
    let url_small_image : String
    
    
    
    static var castExample = Cast(name: "Bruce Willis", character_name: "Split", url_small_image: "cast_Image")
}
