//
//  MovieBannerView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 20/5/24.
//

import SwiftUI

struct MovieBannerView: View {
    
    var movie : Movie
    var body: some View {
       
        /*
        AsyncImage(url: URL(string: movie.large_cover_image)){ phase in
            if let image = phase.image{
                
                image
                    .resizable()
                    .frame(height: 300)
                    .overlay {
                        VStack(alignment: .leading){
                            
                            HStack (spacing: 0){
                                
                                Group{
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(Color.white)
                                    
                                    Text("\(movie.rating.formatted())")
                                        .foregroundStyle(Color.white)
                                        .padding(10)
                                        .font(.subheadline)
                                }
                                .padding(EdgeInsets())
                            }
                            .frame(height: 100)
                            .background(.ultraThinMaterial)
                            .padding()
                            .opacity(0.7)
                            .clipShape(.rect(cornerRadius: 10).stroke())
                            
                            
                            Spacer()
                            Rectangle()
                                .frame(maxWidth: .infinity, maxHeight: 100)
                                .background(.ultraThinMaterial)
                                .opacity(0.7)
                                .overlay {
                                    HStack{
                                        VStack(alignment: .leading, spacing: 0){
                                            Text(movie.title)
                                                .font(.title2)
                                                .fontWeight(.medium)
                                                .foregroundStyle(Color.white)
                                                .minimumScaleFactor(0.8)
                                            HStack{
                                                ForEach(movie.genres, id: \.self){genre in
                                                    Text(genre)
                                                        .font(.caption)
                                                        .fontWeight(.medium)
                                                        .foregroundStyle(Color.white)
                                                }
                                                
                                            } // Genre
                                            HStack{
                                                Capsule()
                                                    .stroke(Color.white)
                                                    .frame(maxWidth: 35, maxHeight: 20 )
                                                    .background{
                                                        Text("\(movie.rating.formatted())")
                                                            .foregroundStyle(Color.white)
                                                            .font(.footnote)
                                                    }
                                                Capsule()
                                                    .stroke(Color.white)
                                                    .frame(width: 50, height: 20)
                                                    .background{
                                                        Text(verbatim: "\(movie.year)")
                                                            .foregroundStyle(Color.white)
                                                            .font(.footnote)
                                                    }
                                            } // Capsules
                                        } //Short Details
                                      
                                        Spacer()
                                        
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                            Text("Add to Watchlist")
                                                .foregroundStyle(Color.white)
                                                .padding(10)
                                                .font(.subheadline)
                                                .background(Color.purple)
                                                .clipShape(.rect(cornerRadius: 10))
                                        }
                                        )
                                        
                                    }
                                    .padding()
                                }
                        }
                    }
                    .clipShape(.rect(cornerRadius: 20))
                    
                
            } else if phase.error != nil {
                Text("There was an Error Loading the Image")
            }else {
                Image(movie.large_cover_image)
                                .resizable()
                                .frame(width: 50, height: 50)
                                .padding()
                                .aspectRatio(contentMode: .fill)
            }
        }
        */
      
        
        Image(movie.large_cover_image)
         .resizable()
         .frame(height: 300)
         .overlay {
             VStack(alignment: .leading){
                 
                 HStack (spacing: 0){
                     
                     Group{
                         Image(systemName: "star.fill")
                             .foregroundStyle(Color.white)
                         
                         Text("\(movie.rating.formatted())")
                             .foregroundStyle(Color.white)
                             .padding(10)
                             .font(.subheadline)
                     }
                     .padding(EdgeInsets())
                 }
                 .frame(height: 30)
                 .background(.ultraThinMaterial)
                 .padding()
                 .clipShape(RoundedRectangle(cornerRadius: 100))
                 .opacity(0.7)
                
                 
                 
                 Spacer()
                 Rectangle()
                     .frame(maxWidth: .infinity, maxHeight: 100)
                     .background(.ultraThinMaterial)
                     .opacity(0.7)
                     .overlay {
                         HStack{
                             VStack(alignment: .leading, spacing: 0){
                                 Text(movie.title)
                                     .font(.title2)
                                     .fontWeight(.medium)
                                     .foregroundStyle(Color.white)
                                     .minimumScaleFactor(0.8)
                                 HStack{
                                     ForEach(movie.genres, id: \.self){genre in
                                         Text(genre)
                                             .font(.caption)
                                             .fontWeight(.medium)
                                             .foregroundStyle(Color.white)
                                     }
                                     
                                 } // Genre
                                 HStack{
                                     Capsule()
                                         .stroke(Color.white)
                                         .frame(maxWidth: 35, maxHeight: 20 )
                                         .background{
                                             Text("\(movie.rating.formatted())")
                                                 .foregroundStyle(Color.white)
                                                 .font(.footnote)
                                         }
                                     Capsule()
                                         .stroke(Color.white)
                                         .frame(width: 50, height: 20)
                                         .background{
                                             Text(verbatim: "\(movie.year)")
                                                 .foregroundStyle(Color.white)
                                                 .font(.footnote)
                                         }
                                 } // Capsules
                             } //Short Details
                           
                             Spacer()
                             
                             Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                 Text("Add to Watchlist")
                                     .foregroundStyle(Color.white)
                                     .padding(10)
                                     .font(.subheadline)
                                     .background(Color.purple)
                                     .clipShape(.rect(cornerRadius: 10))
                             }
                             )
                             
                         }
                         .padding()
                     }
             }
         }
         .clipShape(.rect(cornerRadius: 20))
            
    }
}

#Preview {
    MovieBannerView(movie: Movie.movieExample)
}
