//
//  LoginView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 5/6/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email : String = ""
    @State private var passwoed : String = ""
    
    var body: some View {
        NavigationStack{
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
                    VStack{
                        Text("BS Movie Center")
                            .font(.largeTitle)
                            .fontWeight(.black)
                        
                        Text("Lets Sign In")
                        
                      ResuableTextField(enteredText: $email, title: "Email", forPassword: false)
                        ResuableTextField(enteredText: $passwoed, title: "Password", forPassword: true)
                    }
                    .padding(.top, 80)
                  
                    Spacer()
                    
                    VStack{
                        Button(action: {
                          // Handle sign in action
                          print("Sign In button pressed!")
                        }) {
                          Text("Sign In")
                            .foregroundColor(.white)
                            .font(.title2) // Adjust font size if needed
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                        Button(action: {
                          // Handle sign in action
                          print("Sign In button pressed!")
                        }) {
                            HStack{
                                Image("google_logo") // Replace with your Google logo image name
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                      
                                      Text("Sign In with Google")
                                        .foregroundColor(.black)
                                        .font(.title2)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.white)
                        .cornerRadius(10)
                        
                        
                        NavigationLink {
                            SignupView()
                                .navigationBarBackButtonHidden(true)
                        } label: {
                            HStack{
                                Text("Don't have an account?")
                                Text("Sign Up")
                                    .fontWeight(.bold)
                            }
                        }
                        

                        
                    }
                    .padding(.bottom,100)
                   
                    
                    
                }
                .padding()
                
                    
                    
            }
        }
            
        
     
        
    }
}

#Preview {
    LoginView()
}
