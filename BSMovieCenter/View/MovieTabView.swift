//
//  MovieTabView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct MovieTabView: View {
    let viewModel : MovieInfoViewModel
    var body: some View {
        VStack {
            
            
            if viewModel.isLoading {
                Image("medium_cover_image_dummy")
                 .resizable()
                 .frame(height: 250)
                 .clipShape(.rect(cornerRadius: 20))
                 .redacted(reason: .placeholder)
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
                .tabViewStyle(.page(indexDisplayMode: .never))
                .tabViewStyle(.automatic)
                
                
            }
     
        }
        .frame(height: 250)
        .onAppear{
            Task{
                await viewModel.fetchMovieData()
            }
        }
    }
}

#Preview {
    MovieTabView(viewModel: MovieInfoViewModel())
}
