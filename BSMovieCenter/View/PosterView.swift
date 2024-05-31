//
//  PosterView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct PosterView: View {
    
    var movie : Movie
   @State var isLoading = true
    var body: some View {
        VStack(alignment : .leading, spacing: 0){
           
            
            AsyncImage(url: URL(string: movie.large_cover_image)){ phase in
                if let image = phase.image{
                    image
                        .resizable()
                        .scaledToFit()
                        .overlay {
                            VStack(){
                                HStack{
                                    BannerRatingView(movie: movie)
                                        
                                    Spacer()
                                }
                                .padding(10)
                                
                                Spacer()
                            }
                        }
                        .clipShape(.rect(cornerRadius: 15))
                }else {
                    VStack{
                        Image(K.ImageAssetNames.movieCoverImage)
                            .resizable()
                            .scaledToFit()
                            .overlay {
                                VStack(){
                                    HStack{
                                        BannerRatingView(movie: movie)
                                        Spacer()
                                    }
                                    .padding(10)
                                    
                                    Spacer()
                                }
                            }
                            .redacted(reason: .placeholder)
                            .shimmering()
                            .clipShape(.rect(cornerRadius: 15))
                    }
                    
                }
            }
            .frame(height: 200)
            
            Text(movie.title)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: 120,alignment: .leading)
                .lineLimit(1)
                .truncationMode(.tail)
            
            
            HStack{
                Text(String(movie.year))
                Circle()
                    .frame(width: 3, height: 3)
                Text(Util.minutesToHoursAndMinutesPoster(movie.runtime))
            }
            .font(.caption)
        }
        
       
        
    }
}

#Preview {
    PosterView(movie: Movie.movieExample)
}
