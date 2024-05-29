//
//  SearchMovieView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 24/5/24.
//

import SwiftUI
import Combine
struct SearchMovieView: View {
    
    
    @State var searchedText = ""
    @State var viewModel = SearchMovieViewModel()
    @State var movieList : [Movie] = []
    @State var showProgress = false
    
    var body: some View {
        
    
        
        NavigationStack{
            
          
                
                ZStack{
                    Color("AppBackgroundColor")
                        .ignoresSafeArea()
                    VStack(spacing: 20){
                        
                        HStack{
                            Text("Search.")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Image(systemName: "slider.vertical.3")
                                    .foregroundStyle(.white)
                                    .font(.title2)
                                    .fontWeight(.semibold)
                            })
                        }
                        
                        HStack {
                          Image(systemName: "magnifyingglass")
                          TextField("Search...", text: $searchedText)
                                .autocorrectionDisabled()
                                .textInputAutocapitalization(.never)
                            .overlay(
                              HStack {
                                Spacer()
                                if !searchedText.isEmpty { // Show clear button only when text is entered
                                  Button {
                                    searchedText = "" // Clear search text
                                  } label: {
                                    Image(systemName: "xmark.circle.fill")
                                      .foregroundColor(.gray)
                                      .font(.body)
                                  }
                                }
                              }
                            )
                            .onChange(of: searchedText) { _ , newValue in
                                if !newValue.isEmpty{
                                    Task{
                                      await viewModel.SearchMovieData(movieName: newValue)
                                    }
                                    if !viewModel.isLoading{
                                        if let gotMovie = viewModel.movieList{
                                            movieList = gotMovie
                                        }
                                        showProgress = false
                                    } else{
                                        showProgress = true
                                    }
                                    
                                }
                                else{
                                    movieList = []
                                    showProgress = false
                                }
                            }
                     
                            
                        }
                        .font(.title2)
                        .foregroundStyle(.white)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(30)
                        
                        ZStack(alignment: .center){
                            if showProgress{
                                ProgressView()
                            }else{
                                
                                ScrollView {
                                    LazyVStack{
                                        ForEach(movieList, id: \.id){ movie in
                                            
                                            NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                                ListCellView(movie: movie, showWatchlistButton: true)
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                            
                                            
                                        }
                                    }
                                    
                                }
                            }
                        }
                        Spacer()
                      
                     
                        
                        
                    }
                    .padding()
                    
                    
                }
            
            
          
        }
      
    }
}

#Preview {
    SearchMovieView()
}


/*
 .onChange(of: searchedText) { _ , newValue in
     if !newValue.isEmpty{
         Task{
           await viewModel.SearchMovieData(movieName: newValue)
         }
         if !viewModel.isLoading{
             if let gotMovie = viewModel.movieList{
                 movieList = gotMovie
             }
             showProgress = false
         } else{
             showProgress = true
         }
         
     }
     else{
         movieList = []
         showProgress = false
     }
 }
 */
