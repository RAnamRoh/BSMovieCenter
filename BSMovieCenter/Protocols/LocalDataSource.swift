//
//  LocalDataSource.swift
//  BSMovieCenter
//
//  Created by BS00834 on 5/6/24.
//

import Foundation


protocol LocalDataSource{
    func getData<T: Codable>() async throws -> T
}
