//
//  MovieDetailView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 23/5/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieId : Int
    
    @State var viewModel = MovieDetailViewModel()
    
    var body: some View {
        GeometryReader{ geometry in
            
            let blurredImageHeight = geometry.size.height * 0.6
            let foregroundImageHeight = geometry.size.height * 0.5

            
            ZStack{
                
                Color("AppBackgroundColor")
                VStack{
                    AsyncImage(url: URL(string: movie.background_image)){ phase in
                        if let image = phase.image{
                            
                            image
                                .resizable()
                                .frame(height: blurredImageHeight)
                        } else if phase.error != nil {
                            Image(movie.large_cover_image)
                             .resizable()
                             .frame(height: blurredImageHeight)
                           
                        }else {
                            Image(movie.large_cover_image)
                             .resizable()
                             .frame(height: blurredImageHeight)
                        }
                    }
                    .ignoresSafeArea()
                    Spacer()
                }
                .blur(radius: 30)
                
                ScrollView{
                    
                    
                    VStack() {
                        AsyncImage(url: URL(string: movie.background_image)){ phase in
                            if let image = phase.image{
                                
                                image
                                    .resizable()
                                    .frame(height: foregroundImageHeight)
                                    .clipShape(.rect(cornerRadius: 20))
                                    
                                
                            } else if phase.error != nil {
                                Image(movie.large_cover_image)
                                 .resizable()
                                 .frame(height: foregroundImageHeight)
                                 .clipShape(.rect(cornerRadius: 20))
                            }else {
                                Image(movie.large_cover_image)
                                 .resizable()
                                 .frame(height: foregroundImageHeight )
                                 .clipShape(.rect(cornerRadius: 20))
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 5){
                            HStack{
                                ForEach(movie.genres, id: \.self){genre in
                                    Text(genre)
                                        .font(.callout)
                                        .fontWeight(.regular)
                                        .foregroundStyle(Color.white)
                                    if genre != movie.genres.last {
                                        Circle()
                                            .foregroundStyle(Color.white)
                                            .frame(width: 3)
                                    }
                                }
                               
                            }
                            Text(movie.title)
                                .font(.title)
                                .fontWeight(.semibold)
                            BannerYear_RuntimeView(movie: movie)
                            
                            Text(movie.summary)
                                .lineLimit(3)
                            
                           
                        }
                        
                        VStack{
                            Button(action: {}) {
                                Text("Add to Watchlist")
                                    .foregroundStyle(Color.white)
                                    .frame(maxWidth: .infinity)
                                    .padding(10)
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .background(Color("WatchlistButtonColor"))
                                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                            }
                            
                            HStack{
                                MovieRatingDetailView(movie: movie)
                            }
                            
                        }
                        
                        
                        VStack(alignment: .leading){
                            Text("Cast")
                                .font(.title2)
                            ScrollView(.horizontal) {
                                HStack{
                                    
                                    if let cast = movie.cast {
                                        ForEach(cast, id: \.self){ cast in
                                            CastView(cast: cast)
                                        }
                                    }
                                    
                                    
                                }
                            }
                        }
                        
                        
                        
                        
                        
                    }
                }
                .padding()
                .scrollIndicators(.hidden)
            }
            .onAppear{
                Task{
                    await viewModel.fetchMovie(id: movieId)
                }
            }
        }
       
        
        
        
    }
}

#Preview {
    MovieDetailView(movieId: 100)
}
