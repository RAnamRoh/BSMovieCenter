//
//  ContentView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 17/5/24.
//

import SwiftUI

struct HomeView: View {
    
    
    @State var viewModel = MovieInfoViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(viewModel.movieData?.status ?? "Could not Fetch")
            Text(viewModel.movieData?.status_message ?? "Could not Fetch")
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
