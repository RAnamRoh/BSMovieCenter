//
//  SearchMovieViewModel.swift
//  BSMovieCenter
//
//  Created by BS00834 on 24/5/24.
//

import Foundation
//import SwiftUI
@Observable
class SearchMovieViewModel{
    
    let networkService : NetworkService
    
    var movieData : MovieData?
    
    var movieList : [Movie]?
    
   
    
    var isLoading : Bool = true
    
    var noMovieFound : Bool = false
    
    init(networkService: NetworkService = NetworkService(), movieData: MovieData? = nil, isLoading: Bool = true) {
        self.networkService = networkService
        self.movieData = movieData
        self.isLoading = isLoading
    }
    
    @MainActor
    func SearchMovieData(movieName : String) async {
        movieList = []
        noMovieFound = false
        isLoading = true
        do{
            movieData = try await networkService.fetchObjectData(from: "\(K.BASE_URL)?query_term=\(movieName)")
       
        }
        catch{
            if let networkError = error as? NetworkError {
                switch networkError {
                case .invalidUrl :
                    print("Invalid URL")
                case .invalidData:
                    print("Invalid Data")
                case .decodingError:
                    noMovieFound = true
                    print("Decoding Problem Satoru Gojo Bhai")
                }
            }
            
            print("Error From ViewMOdel Search Movie")
            
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
    
    @MainActor
    func sortBy(searchedMovie: String?,  query : SortMovieBy) async {
        
        movieList = []
        noMovieFound = false
        print("Sorted Movie Called")
        print("moviesList Count \(movieList?.count)")
        do{
            if let searchedMovie = searchedMovie{
                movieData = try await networkService.fetchObjectData(from: "\(K.BASE_URL)?query_term=\(searchedMovie)&sort_by=\(query.rawValue)")
            }
            else{
                movieData = try await networkService.fetchObjectData(from: "\(K.BASE_URL)?sort_by=\(query.rawValue)")
            }
            
        }
        catch{
            if let networkError = error as? NetworkError {
                switch networkError {
                case .invalidUrl :
                    print("Invalid URL")
                case .invalidData:
                    print("Invalid Data")
                case .decodingError:
                    
                    print("Decoding Problem Bhai re Bhaii from SOrted")
                }
            }
            
            print("Error From SearchMovie ViewModel")
            
        }
        
        if let movieData = movieData {
          // Data fetched successfully, update UI
          isLoading = false
        movieList = movieData.data.movies
          // Use movieData for further processing
            print("movieList Count After Filter \(movieList?.count)")
        } else {
          // Handle network or parsing error
          isLoading = true // Or set to another error state
          // Show error message to the user
        }
        
    }
    
    func filterMovies(byGenres genres: Set<MovieGenre>, from movies: [Movie]) -> [Movie] {
        return movies.filter { movie in
            let movieGenres = Set(movie.genres.compactMap { MovieGenre(rawValue: $0) })
            return genres.isSubset(of: movieGenres)
        }
    }
    
}
