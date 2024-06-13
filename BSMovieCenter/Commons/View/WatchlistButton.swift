//
//  WatchlistButton.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI
import SimpleToast

struct WatchlistButton: View {
    
    @EnvironmentObject var watchListViewModel : WatchListViewModel
    
    let movie : Movie
    
    var inWatchlistBool : Bool {
        watchListViewModel.movieWatchList.contains(where: {$0.id == movie.id})
    }
    
    var body: some View {
        Button(action: {
            
            Task {
                if inWatchlistBool {
                    await watchListViewModel.removeMovie(movie: movie)
                } else {
                    await watchListViewModel.addMovie(movie: movie)
                }
            }
        }) {
            Text(inWatchlistBool ? "In Watchlist" : "Add to Watchlist")
                .foregroundStyle(Color.white)
                .padding(10)
                .font(.subheadline)
                .background(inWatchlistBool ? Color.green : Color("WatchlistButtonColor"))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
    }
}

#Preview {
    
    WatchlistButton(movie: Movie.movieExample)
}
