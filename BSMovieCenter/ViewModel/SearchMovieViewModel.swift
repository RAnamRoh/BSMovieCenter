//
//  SearchMovieViewModel.swift
//  BSMovieCenter
//
//  Created by BS00834 on 24/5/24.
//

import Foundation

@Observable
class SearchMovieViewModel{
    
    let networkService : NetworkService
    
    var movieData : MovieData?
    
    var movieList : [Movie]?
    
    var isLoading = true
    
    init(networkService: NetworkService = NetworkService(), movieData: MovieData? = nil, isLoading: Bool = true) {
        self.networkService = networkService
        self.movieData = movieData
        self.isLoading = isLoading
    }
    
    @MainActor
    func SearchMovieData(movieName : String) async {
        do{
            movieData = try await networkService.fetchObjectData(from: "\(K.BASE_URL)?query_term=\(movieName)")
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
        movieList = movieData.data.movies
          // Use movieData for further processing
        } else {
          // Handle network or parsing error
          isLoading = true // Or set to another error state
          // Show error message to the user
        }
        
    }
    
}