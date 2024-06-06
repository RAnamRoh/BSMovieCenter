//
//  SignupView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 6/6/24.
//

import SwiftUI

struct SignupView: View {
    
    @State private var email : String = ""
    @State private var fullName : String = ""
    @State private var passwoed : String = ""
    @Environment(\.dismiss) var dismiss
    
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
                VStack{
                    Text("BS Movie Center")
                        .font(.largeTitle)
                        .fontWeight(.black)
                    
                    Text("Lets Sign Up")
                    
                    ResuableTextField(enteredText: $email, title: "Email Address", forPassword: false)
                    ResuableTextField(enteredText: $email, title: "Full Name", forPassword: false)
                    ResuableTextField(enteredText: $email, title: "Password", forPassword: false)
                }
                .padding(.top, 80)
                Spacer()
                
                VStack{
                    Button(action: {
                      // Handle sign in action
                      print("Sign up button pressed!")
                    }) {
                      Text("Sign Up")
                        .foregroundColor(.white)
                        .font(.title2) // Adjust font size if needed
                    }
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
                    
                    Button(action: {
                        dismiss.callAsFunction()
                    }, label: {
                        HStack{
                            Text("Already have an account?")
                            Text("Sign In")
                                .fontWeight(.bold)
                        }
                        
                    })
            
                }
                .padding(.bottom,100)
            
            }
            .padding()
        }
    }
}

#Preview {
    SignupView()
}
