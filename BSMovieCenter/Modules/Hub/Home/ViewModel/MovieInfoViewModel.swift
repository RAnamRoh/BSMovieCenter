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
    
    @MainActor
    func fetchMovieData() async {
        do{
            movieData = try await networkService.fetchObjectData(from: K.BASE_URL)
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
        
        if let movieData = movieData {
          // Data fetched successfully, update UI
          isLoading = false
          // Use movieData for further processing
        } else {
          // Handle network or parsing error
          isLoading = true // Or set to another error state
          // Show error message to the user
        }
        
    }
    
    
    
}
