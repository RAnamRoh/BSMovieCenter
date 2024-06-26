//
//  ListCellView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 24/5/24.
//

import SwiftUI

struct ListCellView: View {
    
    let movie : Movie
    var showWatchlistButton : Bool
    var body: some View {
        
     
        HStack{
            AsyncImage(url: URL(string: movie.large_cover_image)){ phase in
                if let image = phase.image{
                    
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                    
                    
                } else if phase.error != nil {
                    Image(K.ImageAssetNames.movieCoverImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                        .redacted(reason: .placeholder)
                        .shimmering()
                }else {
                    Image(K.ImageAssetNames.movieCoverImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120)
                        .redacted(reason: .placeholder)
                        .shimmering()
                }
            }
            VStack(alignment: .leading, spacing: 0){
                HStack{
                    ForEach(movie.genres, id: \.self){genre in
                        Text(genre)
                            .font(.caption)
                            .fontWeight(.regular)
                            .foregroundStyle(.primary)
                        if genre != movie.genres.last {
                            Circle()
                                .foregroundStyle(.primary)
                                .frame(width: 3)
                        }
                    }
                    
                }
                .lineLimit(1)
                Text(movie.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                BannerYear_RuntimeView(movie: movie, onTabView: false)
                Spacer()
                HStack{
                    HStack{
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color.yellow)
                        Text(movie.rating.formatted())
                    }
                    Spacer()
                    if showWatchlistButton{
                        WatchlistButton(movie: movie)
                    }
                    
                }
                .padding(.top,20)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: 180)
        .background(Color.gray.opacity(0.2))
        .clipShape(.rect(cornerRadius: 10))
        
    }
}

#Preview {
    ListCellView(movie: Movie.movieExample, showWatchlistButton: true)
}
