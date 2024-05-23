//
//  MovieDetailViewModel.swift
//  BSMovieCenter
//
//  Created by BS00834 on 23/5/24.
//

import Foundation


@Observable
class MovieDetailViewModel {
    
    
    let networkService : NetworkService
    
    var movieDetail : MovieDetail?
    
    var movie : Movie?
    
    var isLoading = true
    
    init(networkService: NetworkService = NetworkService(), movieDetail: MovieDetail? = nil, isLoading: Bool = true) {
        self.networkService = networkService
        self.movieDetail = movieDetail
        self.isLoading = isLoading
    }
    
    
    func fetchMovie(id : Int) async {
        do{
            movieDetail = try await networkService.fetchObjectData(from: "\(K.BASE_URL)?movie_id=\(id)&with_cast=true")
            movie = movieDetail?.data.movie
        }
        catch{
            print("Error In MovieDetailsViewModel : \(error.localizedDescription)")
        }
    }
    
    
}
