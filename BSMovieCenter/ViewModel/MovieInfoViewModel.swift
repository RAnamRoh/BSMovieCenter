//
//  MovieInfoViewModel.swift
//  BSMovieCenter
//
//  Created by BS00834 on 17/5/24.
//

import Foundation

@Observable
class MovieInfoViewModel {
    
    let networkService : NetworkService
    
    var movieData : MovieData?
    
    var isLoading = true
    
    init(networkService: NetworkService = NetworkService(), movieData: MovieData? = nil) {
        self.networkService = networkService
        self.movieData = movieData
    }
    
    func fetchMovieData() async {
        do{
            movieData = try await networkService.fetchObjectData(from: "https://yts.mx/api/v2/list_movies.json?sort_by=recent&order_by=desc")
        }
        catch{
//            if let networkError = error as? NetworkError {
//                switch networkError {
//                case .invalidUrl :
//                    print("Invalid URL")
//                case .invalidData:
//                    print("Invalid Data")
//                case .decodingError:
//                    print("Decoding Problem")
//                }
//            }
            
            print("Error From ViewMOdel")
            
        }
        isLoading = false
    }
    
    
    
}
