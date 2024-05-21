//
//  TopPickView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct TopPickView: View {
    
    let movieArray : [Movie]
    
    var body: some View {
        VStack(spacing: 5){
            HStack{
                Text("Top Picks")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("See All")
                        .fontWeight(.semibold)
                })
            }
            .foregroundStyle(Color.white)
            ScrollView(.horizontal) {
                HStack(spacing: 15){
                    ForEach(movieArray, id: \.id){ movie in
                        PosterView(movie: movie)
                    }
                }
            }
        }
        
    }
}

#Preview {
    TopPickView(movieArray: Movie.movieArrayExample)
}
