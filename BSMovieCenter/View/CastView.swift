//
//  CastView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 23/5/24.
//

import SwiftUI

struct CastView: View {
    
    let cast : Cast
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                AsyncImage(url: URL(string: cast.url_small_image)){ phase in
                    if let image = phase.image{
                        
                        image
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(.rect(cornerRadius: 20))
                            
                    } else if phase.error != nil {
                        Image(cast.url_small_image)
                         .resizable()
                         .frame(width: 150, height: 150)
                         .clipShape(.rect(cornerRadius: 20))
                    }else {
                        Image(cast.url_small_image)
                         .resizable()
                         .frame(width: 150, height: 150)
                         .clipShape(.rect(cornerRadius: 20))
                    }
                }
                Text(cast.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(cast.character_name)
                    .font(.title3)
                    .foregroundStyle(Color.gray)
            }
        }
    }
}

#Preview {
    CastView(cast: Cast.castExample)
}
