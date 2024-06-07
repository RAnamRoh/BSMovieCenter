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
    @State private var password : String = ""
    @Environment(\.dismiss) var dismiss
    
    @EnvironmentObject var authViewModel : AuthViewModel
    @State private var showAlert : Bool = false
    
    var body: some View {
        VStack{
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
                            .textInputAutocapitalization(.never)
                            .autocorrectionDisabled(true)
                        ResuableTextField(enteredText: $fullName, title: "Full Name", forPassword: false)
                        ResuableTextField(enteredText: $password, title: "Password", forPassword: false)
                            .autocorrectionDisabled(true)
                            .textInputAutocapitalization(.never)
                    }
                    .padding(.top, 80)
                    Spacer()
                    
                    VStack{
                        Button(action: {
                         
                            Task{
                                try await authViewModel.createUser(withEmail: email, password: password, fullName: fullName)
                            }
                            
                          print("Sign up button pressed!")
                        }) {
                          Text("Sign Up")
                            .foregroundColor(.white)
                            .font(.title2) // Adjust font size if needed
                        }
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.blue)
                        .disabled(!isFormValid)
                        .opacity(isFormValid ? 1 : 0.5)
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

extension SignupView : AuthenticationFormProtocol {
    var isFormValid: Bool {
        return !email.isEmpty
        && Util.isValidEmail(email)
        && !password.isEmpty
        && password.count > 5
        && !fullName.isEmpty
    }
}

#Preview {
    SignupView()
        .environmentObject(AuthViewModel())
}
