//
//  BannerRatingView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct BannerRatingView: View {
    
    let movie : Movie
    
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
            Text(String(format: "%.1f", movie.rating))
                .font(.subheadline)
                .fontWeight(.bold)
        }
        .padding(5)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.ultraThinMaterial)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )
        )
    }
}

#Preview {
    BannerRatingView(movie: Movie.movieExample)
}
