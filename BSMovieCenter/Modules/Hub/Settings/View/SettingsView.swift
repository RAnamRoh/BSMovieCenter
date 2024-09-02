//
//  SettingsView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 30/5/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.locale) var locale
    @AppStorage("appLanguage") private var appLanguage : String = "en"
    @State private var selectedLanguage : String = UserDefaults.standard.string(forKey: "appLanguage") ?? "en"
    @State var languageArray : [String] = ["English", "Bangla"]
    
    @State var showRestartAlert : Bool = false
    
    enum Language: String, CaseIterable {
        case english = "en"
        case bangla = "bn" // You might need to adjust the code for Bangla based on your specific dialect
    }
    
    
    
    @AppStorage("darkModeEnabled") var darkModeEnabled : Bool = false
    
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        
        if let user = authViewModel.currentUser {
            VStack{
                HStack{
                    Text("Setting")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .padding(.horizontal,20)
                Form{
                    
                    Section{
                        HStack{
                            Text(user.initials)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                                .frame(width: 72, height: 72)
                                .background(Color(.systemGray3))
                                .clipShape(Circle())
                            
                            VStack(alignment: .leading){
                                Text(user.fullName)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                Text(user.email)
                                    .font(.headline)
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    
                    Section("Select Language") {
                        
                        /*
                         HStack{
                         Text("Selected Language")
                         Spacer()
                         
                         Button("EN") {
                         appLanguage = "en"
                         }
                         
                         Button("BN") {
                         appLanguage = "bn"
                         }
                         }
                         */
                        Button(action: {
                            self.selectLanguage("en")
                        }) {
                            HStack {
                                Text("English")
                                Spacer()
                                if selectedLanguage == "en" {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                }
                            }
                        }
                        .foregroundColor(selectedLanguage == "en" ? .primary : .secondary)
                        .listRowBackground(selectedLanguage == "en" ? Color.blue.opacity(0.2) : Color.clear)
                        
                        Button(action: {
                                             self.selectLanguage("bn")
                                         }) {
                                             HStack {
                                                 Text("Bangla")
                                                 Spacer()
                                                 if selectedLanguage == "bn" {
                                                     Image(systemName: "checkmark")
                                                         .foregroundColor(.blue)
                                                 }
                                             }
                                         }
                                         .foregroundColor(selectedLanguage == "bn" ? .primary : .secondary)
                                         .listRowBackground(selectedLanguage == "bn" ? Color.blue.opacity(0.2) : Color.clear)
         
                        
                        
                    }
                    
                    Section("Theme") {
                        Toggle("Dark Mode", isOn: $darkModeEnabled)
                    }
                    
                    Section("Account"){
                        
                        Button(action: {
                            print("Sign Out Pressed")
                            authViewModel.signOut()
                        }, label: {
                            SettingRowView(imageName: "arrow.left.circle", title: "Sign Out", tintColor: Color.red)
                        })
                        .buttonStyle(PlainButtonStyle())
                        
                        Button(action: {
                            Task{
                              try await authViewModel.deleteAccount()
                            }
                            
                        }, label: {
                            SettingRowView(imageName: "xmark.circle.fill", title: "Delete Account", tintColor: Color.red)
                        })
                        .buttonStyle(PlainButtonStyle())
                        
                       
                    }
                }
                .alert(isPresented: $showRestartAlert) {
                               Alert(
                                   title: Text("Restart Required"),
                                   message: Text("The app needs to restart to apply the new language."),
                                   dismissButton: .default(Text("OK"), action: {
                                       exit(0)
                                   })
                               )
                           }
            }
        }
        else {
            Text("There is a Problem Loading User Data")
                .onTapGesture {
                    authViewModel.signOut()
                }
        }
        
        
        
    }
    
    private func selectLanguage(_ language: String) {
        if selectedLanguage != language {
            selectedLanguage = language
            appLanguage = selectedLanguage
            showRestartAlert = true
        }
    }
}

#Preview {
    SettingsView()
}


