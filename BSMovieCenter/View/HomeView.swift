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
    
    
    @State var viewModel = MovieInfoViewModel()
    
    var body: some View {
        VStack {
            
            
            if viewModel.isLoading {
               Rectangle()
                    .frame(height: 200)
                    .shimmering()
            }
            else{
                
                
                TabView {
                    if let movies = viewModel.movieData?.data.movies {
                            ForEach(movies, id: \.id) { movie in
                          MovieBannerView(movie: movie)
                                
                            }
                  } else {
                    // Handle empty view (optional)
                    Text("No movies found")
                  }
                }
                .tabViewStyle(.page)
                .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                
                /*
                ScrollView(.horizontal) {
                    HStack{
                        ForEach(0..<6){i in
                            MovieBannerView(movie: viewModel.movieData?.data.movies[i] ?? Movie.movieExample)
                                
                        }
                    }
                }
                */
                Text(viewModel.movieData?.status ?? "Could not Fetch")
                Text(viewModel.movieData?.status_message ?? "Could not Fetch")
            }
            
            
            
            
            
        
        }
        .padding()
        .onAppear{
            Task{
                await viewModel.fetchMovieData()
            }
        }
    }
}

#Preview {
    HomeView()
}
