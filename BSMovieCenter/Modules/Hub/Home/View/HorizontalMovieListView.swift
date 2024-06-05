//
//  TopPickView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct HorizontalMovieListView: View {
    
    let movieArray : [Movie]
    
    @State var title : String
    
    
    var body: some View {
        VStack(spacing: 5){
            HStack{
                Text(title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("See All")
                        .fontWeight(.semibold)
                })
            }
            .foregroundStyle(Color.primary)
            ScrollView(.horizontal) {
                HStack(spacing: 15){
                    ForEach(movieArray, id: \.id){ movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            PosterView(movie: movie)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                    }
                }
            }
        }
        
    }
}

#Preview {
    HorizontalMovieListView(movieArray: Movie.movieArrayExample, title: "Top Picks")
}
