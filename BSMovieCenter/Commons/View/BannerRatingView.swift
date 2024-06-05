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
               
        }
        .font(.caption2)
        .fontWeight(.bold)
        .foregroundStyle(Color.white)
        .padding(3)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .overlay(
                    Rectangle()
                        .stroke(Color.white, lineWidth: 1)
                )
                .clipShape(.rect(cornerRadius: 2))
        )
    }
}

#Preview {
    BannerRatingView(movie: Movie.movieExample)
        
}
