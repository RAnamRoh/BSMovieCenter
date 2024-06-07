//
//  User.swift
//  BSMovieCenter
//
//  Created by BS00834 on 6/6/24.
//

import Foundation

struct User: Identifiable, Codable{
    let id : String
    let fullName : String
    let email : String
    var movieWatchList : [Movie]?
    
    
    var initials : String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName){
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        return ""
    }
    
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "Tazpia Tahmida", email: "tazpia@gmail.com ", movieWatchList: nil)
    
    mutating func setMovieWatchList(movieList : [Movie]){
        self.movieWatchList = movieList
    }
    
}
