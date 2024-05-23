//
//  MovieRatingDetailView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 23/5/24.
//

import SwiftUI

struct MovieRatingDetailView: View {
    
    let movie : Movie
    let maxRating : Int = 5

    
    
    var body: some View {
        HStack{
            VStack{
                Text("Overall Rating")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                Text(String(movie.rating))
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    ForEach(0..<maxRating, id: \.self) { index in
                        Image(systemName: index < Int(convertRating(rating: movie.rating)) ? "star.fill" : "star")
                            .foregroundColor(index < Int(convertRating(rating: movie.rating)) ? .yellow : .gray)
                    }
                }
            }
            .padding()
            
            Rectangle()
                .frame(width: 3, height: 150)
          
            
            VStack{
                Text("Your Rating")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("0.0")
                    .font(.title)
                    .fontWeight(.bold)
                HStack {
                    ForEach(0..<maxRating, id: \.self) { index in
                        Image(systemName: "star")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
        }
    }
    
    func convertRating(rating: Double) -> Double {


      let clampedRating = min(max(rating, 0.0), 10.0)
      let convertedRating = round(clampedRating / 2.0)

      return convertedRating
    }
}

#Preview {
    MovieRatingDetailView(movie: Movie.movieExample)
}
