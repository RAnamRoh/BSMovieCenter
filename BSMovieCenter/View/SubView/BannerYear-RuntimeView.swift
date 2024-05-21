//
//  BannerYear-RuntimeView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct BannerYear_RuntimeView: View {
    
    let movie : Movie
    
    var body: some View {
        HStack{
          
           
            Text(String(movie.year))
                .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))
                .background(
                Capsule()
                    .stroke(Color.white , lineWidth: 1)
                )
            Text(Util.minutesToHoursAndMinutes(movie.runtime))
                .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))
                .background(
                Capsule()
                    .stroke(Color.white , lineWidth: 1)
                )
            
        } // Capsules
        .foregroundStyle(Color.white)
        .font(.caption)
    }
}

#Preview {
    BannerYear_RuntimeView(movie: Movie.movieExample)
}
