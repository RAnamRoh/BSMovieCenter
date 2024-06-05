//
//  MovieRepository.swift
//  BSMovieCenter
//
//  Created by BS00834 on 5/6/24.
//

import Foundation

class MovieRepository {
    
    
    private let localDataSource : LocalDataSource
    private let remoteDataSource : RemoteDataSource
    
    init(localDataSource: LocalDataSource, remoteDataSource: RemoteDataSource) {
        self.localDataSource = localDataSource
        self.remoteDataSource = remoteDataSource
    }
    
    func getData<T: Codable>(from url: String) async throws -> T {
        do{
            let remoteData : T = try await remoteDataSource.fetchData(from: url)
            return remoteData
        }
        catch{
            print("Could not Get Data from remote repo")
            return try await localDataSource.getData()
        }
    }
    
    
}
