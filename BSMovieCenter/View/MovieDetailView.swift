//
//  MovieDetailView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 23/5/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieId : Int
    @State var movie = Movie.movieExample
    @State var viewModel = MovieDetailViewModel()
    @EnvironmentObject var watchListViewModel : WatchListViewModel
    
    var body: some View {
        
        NavigationStack{
            GeometryReader{ geometry in
                
                let blurredImageHeight = geometry.size.height * 0.6
                let foregroundImageHeight = geometry.size.height * 0.5
                
                
                ZStack{
                    
                    Color("AppBackgroundColor")
                    
                    if !viewModel.isLoading{
                        VStack{
                            AsyncImage(url: URL(string: movie.large_cover_image)){ phase in
                                if let image = phase.image{
                                    
                                    image
                                        .resizable()
                                        .frame(height: blurredImageHeight)
                                } else if phase.error != nil {
                                    Image(K.ImageAssetNames.movieCoverImage)
                                        .resizable()
                                        .frame(height: blurredImageHeight)
                                        .redacted(reason: .placeholder)
                                        .shimmering()
                                    
                                }else {
                                    Image(K.ImageAssetNames.movieCoverImage)
                                        .resizable()
                                        .frame(height: blurredImageHeight)
                                        .redacted(reason: .placeholder)
                                        .shimmering()
                                }
                            }
                            .ignoresSafeArea()
                            Spacer()
                        }
                        .blur(radius: 30)
                        
                        ScrollView{
                            
                            
                            VStack() {
                                AsyncImage(url: URL(string: movie.large_cover_image)){ phase in
                                    if let image = phase.image{
                                        
                                        image
                                            .resizable()
                                            .frame(height: foregroundImageHeight)
                                            .clipShape(.rect(cornerRadius: 20))
                                        
                                        
                                    } else if phase.error != nil {
                                        Image(K.ImageAssetNames.movieCoverImage)
                                            .resizable()
                                            .frame(height: foregroundImageHeight)
                                            .clipShape(.rect(cornerRadius: 20))
                                            .redacted(reason: .placeholder)
                                            .shimmering()
                                    }else {
                                        Image(K.ImageAssetNames.movieCoverImage)
                                            .resizable()
                                            .frame(height: foregroundImageHeight )
                                            .clipShape(.rect(cornerRadius: 20))
                                            .redacted(reason: .placeholder)
                                            .shimmering()
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
                                    
                                    Text(movie.description_full)
                                        .lineLimit(3)
                                    
                                    
                                }
                                
                                VStack{
                                    Button(action: {
                                        
                                        watchListViewModel.addMovie(movie: movie)
                                        
                                    }) {
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
                    }else {
                        VStack{
                            Rectangle()
                                .frame(width: foregroundImageHeight, height: foregroundImageHeight)
                            Rectangle()
                                .frame(width: foregroundImageHeight, height: 50)
                            Rectangle()
                                .frame(width: foregroundImageHeight, height: 100)
                            Rectangle()
                                .frame(width: foregroundImageHeight, height: 50)
                            Rectangle()
                                .frame(width: foregroundImageHeight, height: 100)
                        }
                        .redacted(reason: .placeholder)
                        .shimmering()
                    }
                    
                    
                }
                .onAppear{
                    Task{
                        await viewModel.fetchMovie(id: movieId)
                        if let vmMovie = viewModel.movieDetail?.data.movie{
                            movie = vmMovie
                        }
                    }
                    
                }
                
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
       
        
        
        
        
    }
}

#Preview {
    MovieDetailView(movieId: 600)
}
