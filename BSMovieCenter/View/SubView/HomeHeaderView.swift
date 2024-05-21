//
//  HomeHeaderView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct HomeHeaderView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Welcome Back,")
                Text("Rakibul Anam Rohid.")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            Spacer()
            Rectangle()
                .stroke(lineWidth: 4)
                .frame(width: 25, height: 25)
                .padding()
                
        }
        .foregroundStyle(Color.white)
        
    }
}

#Preview {
    HomeHeaderView()
        .preferredColorScheme(.dark)
}
