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
    @StateObject var viewModel = MovieDetailViewModel()
    @EnvironmentObject var watchListViewModel : WatchListViewModel
    var inWatchlistBool : Bool {
        watchListViewModel.movieWatchList.contains(where: {$0.id == movie.id})
    }
    @State private var isPlaying = false
    
    
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
                        
                       let movieDetailScroll = ScrollView{
                            
                            
                            VStack(alignment: .leading) {
                                
                                if movie.yt_trailer_code?.count != 0 {
                                    YTView(ytVideoID: movie.yt_trailer_code ?? "")
                                        .frame(height: foregroundImageHeight)
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .onAppear {
                                            //setupNotificationObservers()
                                        }
                                        
                                }else {
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
                                }
                                
                                
                                VStack(alignment: .leading, spacing: 5){
                                    
                                    
                                        HStack{
                                            ForEach(movie.genres, id: \.self){genre in
                                                Text(genre)
                                                    .font(.system(size: 15))
                                                    .fontWeight(.regular)
                                                    .foregroundStyle(.primary)
                                                    .lineLimit(1)
                                                if genre != movie.genres.last {
                                                    Circle()
                                                        .foregroundStyle(.primary)
                                                        .frame(width: 3)
                                                }
                                            }
                                            
                                        }
                                    
                                   
                                     
                                    
                                    
                               
                                    
                                    
                                    
                                    
                                    
                                    Text(movie.title)
                                        .font(.title)
                                        .fontWeight(.semibold)
                                    BannerYear_RuntimeView(movie: movie, onTabView: false)
                                    
                                    Text(movie.description_full)
                                        .lineLimit(3)
                                    
                                    
                                }
                                
                                VStack{
                                    Button(action: {
                                        Task {
                                            if inWatchlistBool {
                                                await watchListViewModel.removeMovie(movie: movie)
                                            } else {
                                                await watchListViewModel.addMovie(movie: movie)
                                            }
                                        }
                                        
                                        
                                    }) {
                                        Text(inWatchlistBool ? "In Watchlist" : "Add to Watchlist")
                                            .foregroundStyle(Color.white)
                                            .frame(maxWidth: .infinity)
                                            .padding(10)
                                            .font(.title3)
                                            .fontWeight(.semibold)
                                            .background(inWatchlistBool ? Color.green : Color("WatchlistButtonColor"))
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
                        
                        if viewModel.movieDetail?.data.movie != nil {
                            movieDetailScroll
                        }else{
                            Text("Movie Not Found")
                        }
                        
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
    
    
    
    private func setupNotificationObservers() {
        NotificationCenter.default.addObserver(forName: NSNotification.Name("PlayVideo"), object: nil, queue: .main) { _ in
            // Handle play event
            print("Play command received")
            isPlaying = true
            // Insert code to play the video here
        }
        
        NotificationCenter.default.addObserver(forName: NSNotification.Name("PauseVideo"), object: nil, queue: .main) { _ in
            // Handle pause event
            print("Pause command received")
            isPlaying = false
            // Insert code to pause the video here
        }
    }

}

#Preview {
    MovieDetailView(movieId: 600)
}
