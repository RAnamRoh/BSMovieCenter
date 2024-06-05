//
//  ContentView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 17/5/24.
//



/*
if viewModel.isLoading {
    ProgressView()
}
else{
    
    AsyncImage(url: URL(string: viewModel.movieData?.data.movies[0].medium_cover_image ?? "")){ phase in
        if let image = phase.image {
            image
                .resizable()
                .scaledToFill()
        } else if phase.error != nil {
            Text("There was an Error Loading the Image")
        }else {
            ProgressView()
        }
    }
    .frame(width: 200,height: 150)
    .clipShape(Capsule())
    
    Text(viewModel.movieData?.status ?? "Could not Fetch")
    Text(viewModel.movieData?.status_message ?? "Could not Fetch")
}
*/



import SwiftUI

struct HomeView: View {
    
    
    @StateObject var viewModel = MovieInfoViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color("AppBackgroundColor")
                    .ignoresSafeArea()
                ScrollView {
                      let homeView =  VStack(spacing: 10){
                            HomeHeaderView()
                            MovieTabView(movies: viewModel.movieData?.data.movies ?? Movie.movieArrayExample, isLoading: viewModel.isLoading)
                          HorizontalMovieListView(movieArray: viewModel.movieData?.data.movies ?? Movie.movieArrayExample, title: "Top Picks")
                          HorizontalMovieListView(movieArray: viewModel.movieData?.data.movies ?? Movie.movieArrayExample, title: "Trending")
                        }
                        .padding(.zero)
                    
                    if viewModel.isLoading{
                        homeView
                            .redacted(reason: .placeholder)
                            .shimmering()
                    }else {
                        homeView
                    }
 
            
                }
                .scrollIndicators(.hidden)
                .padding()
            }
            .onAppear{
                Task{
                    await viewModel.fetchMovieData()
                }
            }
        }
       
    }
}

#Preview {
    HomeView()
}
