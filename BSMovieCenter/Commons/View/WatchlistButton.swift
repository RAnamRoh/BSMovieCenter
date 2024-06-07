//
//  WatchlistButton.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct WatchlistButton: View {
    
    @EnvironmentObject var watchListViewModel : WatchListViewModel
    
    let movie : Movie
    
    var body: some View {
        Button(action: {
            Task{
             await  watchListViewModel.addMovie(movie: movie)
            }
            
          
        }) {
            Text("Add to Watchlist")
                .foregroundStyle(Color.white)
                .padding(10)
                .font(.subheadline)
                .background(Color("WatchlistButtonColor"))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
    }
}

#Preview {

    WatchlistButton(movie: Movie.movieExample)
}
