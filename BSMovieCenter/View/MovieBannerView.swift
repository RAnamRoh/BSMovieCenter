//
//  MovieBannerView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 20/5/24.
//

import SwiftUI

struct MovieBannerView: View {
    
    var movie : Movie
   // var editing = false
    var body: some View {
       
        
        AsyncImage(url: URL(string: movie.background_image)){ phase in
            if let image = phase.image{
                
                image
                    .resizable()
                    .frame(height: 250)
                    .overlay {
                        VStack(alignment: .leading){
                            
                           BannerRatingView(movie: movie)
                                .padding()
                           
                            Spacer()
                            Rectangle()
                                .frame(maxWidth: .infinity, maxHeight: 100)
                                .background(.ultraThinMaterial)
                                .opacity(0.5)
                                .overlay {
                                    HStack{
                                         
                                        BannerMovieDetailView(movie: movie)
                                      
                                        Spacer()
                                        
                                       WatchlistButton()
                                        
                                    }
                                    .padding()
                                }
                        }//Vstack
                    }
                    .clipShape(.rect(cornerRadius: 20))
                    
                
            } else if phase.error != nil {
                Image(K.ImageAssetNames.movieCoverImage)
                 .resizable()
                 .frame(height: 250)
                 .overlay {
                     VStack(alignment: .leading){
                         
                        BannerRatingView(movie: movie)
                             .padding()
                        
                         Spacer()
                         Rectangle()
                             .frame(maxWidth: .infinity, maxHeight: 100)
                             .background(.ultraThinMaterial)
                             .opacity(0.5)
                             .overlay {
                                 HStack{
                                      
                                     BannerMovieDetailView(movie: movie)
                                   
                                     Spacer()
                                     
                                    WatchlistButton()
                                     
                                 }
                                 .padding()
                             }
                     }//Vstack
                 }
                 .clipShape(.rect(cornerRadius: 20))
            }else {
                Image(K.ImageAssetNames.movieCoverImage)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                                .aspectRatio(contentMode: .fill)
            }
        }
        
        
      /*
        if editing {
            Image(movie.large_cover_image)
             .resizable()
             .frame(height: 300)
             .overlay {
                 VStack(alignment: .leading){
                     
                    BannerRatingView(movie: movie)
                         .padding()
                    
                     Spacer()
                     Rectangle()
                         .frame(maxWidth: .infinity, maxHeight: 100)
                         .background(.ultraThinMaterial)
                         .opacity(0.5)
                         .overlay {
                             HStack{
                                  
                                 BannerMovieDetailView(movie: movie)
                               
                                 Spacer()
                                 
                                WatchlistButton()
                                 
                             }
                             .padding()
                         }
                 }//Vstack
             }
             .clipShape(.rect(cornerRadius: 20))
        }
        
       */
            
    }
}

#Preview {
    MovieBannerView(movie: Movie.movieExample)
}
