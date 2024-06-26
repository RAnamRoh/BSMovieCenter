//
//  HomeHeaderView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct HomeHeaderView: View {
    
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text("Welcome Back,")
                Text(authViewModel.currentUser?.fullName ?? "")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            Spacer()
            Rectangle()
                .stroke(lineWidth: 4)
                .frame(width: 25, height: 25)
                .padding()
                
        }
        .foregroundStyle(.primary)
        
    }
}

#Preview {
    HomeHeaderView()
}
