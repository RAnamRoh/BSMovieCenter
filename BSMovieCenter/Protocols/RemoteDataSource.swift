//
//  RemoteDataSource.swift
//  BSMovieCenter
//
//  Created by BS00834 on 5/6/24.
//

import Foundation

protocol RemoteDataSource{
    
    func fetchData<T : Codable>(from url : String) async throws -> T 
    
}
