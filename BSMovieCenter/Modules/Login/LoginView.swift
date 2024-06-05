//
//  LoginView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 5/6/24.
//

import SwiftUI

struct LoginView: View {
    
    @State var searchedText : String = ""
    
    var body: some View {
        
        ZStack{
            Color("AppBackgroundColor")
                .ignoresSafeArea()
            
            BackgroundCurveShape()
                .ignoresSafeArea()
                .scaledToFit()
                .foregroundStyle(Color("SecondaryBackgroundColor"))
                //.aspectRatio(contentMode: .fill)
               // .frame(height: UIScreen.main.bounds.height * 0.5, alignment: .bottom)
                .frame(maxHeight: .infinity, alignment: .bottom)
            
            VStack{
                
                Text("BS Movie Center")
                    .font(.largeTitle)
                    .fontWeight(.black)
                
                Text("Lets Sign In")
                
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
                    .font(.title2)
                    .foregroundStyle(.primary)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 60)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(25)
                
                
                    
            }
                
                
        }
        
    }
}

#Preview {
    LoginView()
}
