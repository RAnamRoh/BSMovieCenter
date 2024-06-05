//
//  FIlterView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 3/6/24.
//

import SwiftUI

struct FilterView: View {
    
    
    @State var sortBy : SortMovieBy = .title
    @State var selectedGenre : Set<MovieGenre> = []
    @State var searchViewModel : SearchMovieViewModel
    @Binding var movieList : [Movie]
    @Binding var searchedText : String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
       
        ZStack{
            Color("AppBackgroundColor")
            VStack{
                HStack{
                    
                    Text("Sort And Filter")
                    
                    Spacer()
                    
                    Button(action: {
                        
                        Task{
                            do{
                                
                                if !searchedText.isEmpty{
                                    await searchViewModel.sortBy(searchedMovie: searchedText, query: sortBy)
                                }else{
                                    await searchViewModel.sortBy(searchedMovie: nil, query: sortBy)
                                }
                                
                                
                                if selectedGenre.isEmpty{
                                    
                                    if let gotMovie = searchViewModel.movieList{
                                        movieList = gotMovie
                                    }
                                }else {
                                    if let gotMovie = searchViewModel.movieList{
                                        movieList = gotMovie
                                        movieList = searchViewModel.filterMovies(byGenres: selectedGenre, from: movieList)
                                        if movieList.count == 0 {
                                            searchViewModel.noMovieFound = true
                                        }
                                    }
                                }
                                
                            }
                        }
                        dismiss.callAsFunction()
                        
                    }, label: {
                        Text("Apply")
                            .padding(10)
                            .foregroundStyle(.white)
                            .background(
                                Color("WatchlistButtonColor")
                            )
                            .fontWeight(.semibold)
                            .clipShape(.rect(cornerRadius: 20))
                    })
                }
                
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                VStack(alignment: .leading){
                    Text("Sort By")
                    Divider()
                   
                    Picker("SortBy", selection: $sortBy) {
                        ForEach(SortMovieBy.allCases , id: \.self) { quality in
                            Text(quality.rawValue)
                               .tag(quality)
                           }
                         }
                    .pickerStyle(.palette)
                    
                    Divider()
                    
                    Text("By Genre")
                    Divider()
                    
                    CustomSegmentedListPicker(selectedGenres: $selectedGenre, genres: MovieGenre.allCases, columns: 4)
                    
                   /*
                    Picker("Genre", selection: $selectedGenre) {
                        ForEach(MovieGenre.allCases, id: \.self) { genre in
                               Text(genre.rawValue)
                                 .tag(genre)
                             }
                           }
                           .pickerStyle(.segmented)
                    */
                   
                       
                          
                    
                    
          
                     
                }
            }
            .padding()
        }
       
    }
}

#Preview {
    FilterView( searchViewModel: SearchMovieViewModel(), movieList: .constant(Movie.movieArrayExample), searchedText: .constant("Hello"))
}
