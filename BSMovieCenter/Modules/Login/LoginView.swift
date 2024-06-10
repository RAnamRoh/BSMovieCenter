//
//  LoginView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 5/6/24.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var showAlert : Bool = false
    @EnvironmentObject var authViewModel : AuthViewModel
    
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
                        ResuableTextField(enteredText: $password, title: "Password", forPassword: true)
                    }
                    .autocorrectionDisabled(true)
                    .textInputAutocapitalization(.never)
                    .padding(.top, 80)
                    
                    Spacer()
                    
                    VStack{
                        Button(action: {
                            // Handle sign in action
                            print("Sign In button pressed!")
                            
                            Task{
                                try await authViewModel.signIn(withEmail: email, password: password)
                            }
                            
                        }) {
                            Text("Sign In")
                                .foregroundColor(.white)
                                .font(.title2) // Adjust font size if needed
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .disabled(!isFormValid)
                        .opacity(isFormValid ? 1 : 0.5)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                        Button(action: {
                            // Handle sign in action
                            print("Sign In with Google button pressed!")
                            
                            Task{
                                try await authViewModel.signInWithGoogle()
                            }
                            
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
                        .buttonStyle(PlainButtonStyle())
                        
                        
                        
                    }
                    .padding(.bottom,100)
                    
                    
                    
                }
                .padding()
                
                
                
            }
            .alert(isPresented: $showAlert, content: {
                Alert(
                    title: Text("Error"),
                    message: Text(authViewModel.authError?.errorDescription ?? "Unknown Error"),
                    dismissButton: .default(Text("OK"), action: {
                        authViewModel.authError = nil
                    })
                )
            })
            .onChange(of: authViewModel.authError) { _, _ in
                if authViewModel.authError != nil {
                    showAlert = true
                }
            }
        }
        
        
        
        
        
    }
}


extension LoginView : AuthenticationFormProtocol {
    var isFormValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && Util.isValidEmail(email)
    }
}


#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
