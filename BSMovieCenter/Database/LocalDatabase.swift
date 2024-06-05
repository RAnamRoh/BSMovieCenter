//
//  LocalDatabase.swift
//  BSMovieCenter
//
//  Created by BS00834 on 5/6/24.
//

import Foundation

class LocalDatabase : LocalDataSource{
    
    private var movieData : MovieData = MovieData(status: "ok", status_message: "ok", data: RepoData(movies: Movie.movieArrayExample))
    
    func getData<T : Codable>() async throws -> T  {
        return movieData as! T
    }
    
    
}
