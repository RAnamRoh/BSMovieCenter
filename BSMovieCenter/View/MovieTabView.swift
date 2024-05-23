//
//  MovieTabView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct MovieTabView: View {
    let movies : [Movie]
    let isLoading : Bool
    @State private var selectedTab = 0
    let indicatorHeight: CGFloat = 5 // Customize indicator height
    let indicatorColor = Color.white // Customize indicator color
    
    var body: some View {
        
        
        VStack {
            
            
            if isLoading {
                Image("medium_cover_image_dummy")
                    .resizable()
                    .frame(height: 250)
                    .clipShape(.rect(cornerRadius: 20))
                    .redacted(reason: .placeholder)
                    .shimmering()
            }
            else{
                
                
                TabView(selection: self.$selectedTab) {
                    if !movies.isEmpty{
                        ForEach(movies, id: \.id) { movie in
                            MovieBannerView(movie: movie)
                                .tag(movie)
                        }
                    } else {
                        // Handle empty view (optional)
                        Text("No movies found")
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .tabViewStyle(.automatic)
                .overlay {
                    
                    VStack(alignment: .trailing){
                        Spacer()
                        HStack{
                            Spacer()
                            HStack (spacing: 0) {
                                
                                if !movies.isEmpty{
                                    ForEach(movies, id: \.self) { index in
                                        if selectedTab == index.id {
                                            Capsule()
                                                .fill(indicatorColor)
                                                .frame(width: 20, height: indicatorHeight)
                                                .onTapGesture {
                                                    print(index)
                                                }
                                                
                                        } else {
                                            Circle()
                                                .fill(.white)
                                                .frame(width: 10, height: 3)
                                                
                                        }
                                    }
                                }
                                
                                
                            }
                            .frame(width: 100,height: 10)
                            .offset(x: 50)
                            .clipped()
                            .padding()
                        }
                        
                        
                    }
                    
                    
                     
                }
                .onTapGesture {
                    //print(selectedTab)
                }
                
            }
            
           
            
        }
        .frame(height: 250)
        .onAppear{
                selectedTab = movies[0].id
        }
        
    }
}

#Preview {
    MovieTabView(movies: Movie.movieArrayExample, isLoading: false)
}
