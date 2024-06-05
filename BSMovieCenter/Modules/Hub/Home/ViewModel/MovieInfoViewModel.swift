//
//  MovieInfoViewModel.swift
//  BSMovieCenter
//
//  Created by BS00834 on 17/5/24.
//

import Foundation

@MainActor
class MovieInfoViewModel : ObservableObject {
    
    //let networkService : NetworkService
    
    
    private var repository : MovieRepository
    
    @Published var movieData : MovieData?
    
    @Published var isLoading = true
 
    init(repository: MovieRepository = MovieRepository(localDataSource: LocalDatabase(), remoteDataSource:NetworkAPI() ), movieData: MovieData? = nil, isLoading: Bool = true) {
        self.repository = repository
        self.movieData = movieData
        self.isLoading = isLoading
    }

    func fetchMovieData() async {
        do{
            movieData = try await repository.getData(from: K.BASE_URL)
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
        
        if movieData != nil {
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
