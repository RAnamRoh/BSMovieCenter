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
    @StateObject var viewModel = SearchMovieViewModel()
    @State var movieList : [Movie] = []
    @State var showProgress : Bool = false
    @State var filterSheetPresented : Bool = false
    @AppStorage("darkModeEnabled") var darkModeEnabled : Bool = false
    
    @State var searchedItemChanged : DispatchWorkItem?
    
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
                        
                        Button(action: {
                            
                            filterSheetPresented.toggle()
                            
                        }, label: {
                            Image(systemName: "slider.vertical.3")
                                .foregroundStyle(.primary)
                                .font(.title2)
                                .fontWeight(.semibold)
                        })
                        .buttonStyle(PlainButtonStyle())
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
                        /*
                         .onChange(of: searchedText) { _ , newValue in
                             if !newValue.isEmpty{
                                 
                                 
                                 DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                     Task{
                                         await viewModel.SearchMovieData(movieName: newValue)
                                     }
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
                            .onChange(of: searchedText) { _, newValue in
                                showProgress = true
                                let apiCall = {
                                    self.searchedItemChanged?.cancel()
                                    let workItem = DispatchWorkItem{
                                        Task{
                                            await viewModel.SearchMovieData(movieName: newValue)
                                            movieList = viewModel.movieList ?? []
                                            showProgress = viewModel.isLoading
                                        }
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: workItem)
                                    self.searchedItemChanged = workItem
                                }
                                
                                apiCall()
                                
                                
                                /*
                                 if !newValue.isEmpty{
                                     apiCall()
                                     
                                     if !viewModel.isLoading{
                                         if let gotMovie = viewModel.movieList{
                                             movieList = gotMovie
                                         }
                                         showProgress = false
                                     } else{
                                         showProgress = true
                                     }
                                     
                                 }else {
                                     movieList = []
                                     showProgress = false
                                     
                                 }
                                 */
                               
                                
                               
                                
                            }
                        
                        
                        
                        
                    }
                    .font(.title2)
                    .foregroundStyle(.primary)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(25)
                    
                    ZStack(alignment: .center){
                        if showProgress{
                            ProgressView()
                        }
                        else if(viewModel.noMovieFound){
                            Text("No Movie Found")
                        }
                        else{
                            
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
                            .refreshable {
                                searchedText = ""
                                movieList = []
                            }
                        }
                    }
                    .sheet(isPresented: $filterSheetPresented, content: {
                        FilterView(searchViewModel: viewModel, movieList: $movieList, searchedText: $searchedText)
                            .environment(\.colorScheme, darkModeEnabled ? .dark : .light)
                    })
                    
                    
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
