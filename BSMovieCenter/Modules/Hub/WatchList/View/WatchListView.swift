//
//  WatchListView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 29/5/24.
//

import SwiftUI

struct WatchListView: View {
    
    @EnvironmentObject var watchListViewModel : WatchListViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                VStack{
                    HStack{
                        Text("WatchList")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                        Spacer()
                    }
                    .padding()
                    List{
                        ForEach(watchListViewModel.movieWatchList, id: \.id){ movie in
                            
                            ZStack{
                                NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                                    ListCellView(movie: movie, showWatchlistButton: false)
                                }
                                .opacity(0)
                                ListCellView(movie: movie, showWatchlistButton: false)
                            }
                            
                           
                        }
                        .onDelete(perform: watchListViewModel.deleteMovie)
                        .listRowSeparator(.hidden)
                     
                      
                    }
                    .listStyle(.plain)
                }
             
                   
                   
                    
                
               
            }
            
            
        }
       
        
    }
}

#Preview {
    NavigationStack{
        WatchListView()
    }
    .environmentObject(WatchListViewModel())
    
        
}
