//
//  BannerMovieDetailView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct BannerMovieDetailView: View {
    
    let movie : Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text(movie.title)
                .font(.title2)
                .fontWeight(.medium)
                .foregroundStyle(Color.white)
            HStack{
                ForEach(movie.genres, id: \.self){genre in
                    Text(genre)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(Color.white)
                }
            }
            
            BannerYear_RuntimeView(movie: movie)
                .padding(EdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 0))
        
        }
    }
}

#Preview {
    BannerMovieDetailView(movie: Movie.movieExample)
}
