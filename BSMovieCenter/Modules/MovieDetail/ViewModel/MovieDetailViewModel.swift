//
//  MovieDetailViewModel.swift
//  BSMovieCenter
//
//  Created by BS00834 on 23/5/24.
//

import Foundation


@MainActor
class MovieDetailViewModel : ObservableObject {
    
    
    //let networkService : NetworkService
    
    @Published var movieDetail : MovieDetail?
    
    //var movie : Movie?
    
    @Published var isLoading = true
    
    private let repository : MovieRepository
    
    init(movieDetail: MovieDetail? = nil, isLoading: Bool = true, repository: MovieRepository = MovieRepository(localDataSource: LocalDatabase(), remoteDataSource: NetworkAPI())) {
        self.movieDetail = movieDetail
        self.isLoading = isLoading
        self.repository = repository
    }
    
    
    func fetchMovie(id : Int) async {
        do{
            
            movieDetail = try await repository.getData(from: "\(K.MOVIE_DETAILS_URL)?movie_id=\(id)&with_cast=true")
            
            /*
            movieDetail = try await networkService.fetchObjectData(from: "\(K.MOVIE_DETAILS_URL)?movie_id=\(id)&with_cast=true")
            */
             
        }
        catch{
            print("Error In MovieDetailsViewModel : \(error.localizedDescription)")
        }
        isLoading = false
       
    }
    
    
}
