//
//  SettingsView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 30/5/24.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.locale) var locale
   @State @AppStorage("appLanguage") private var appLanguage : String = "en"
    @State var languageArray : [String] = ["English", "Bangla"]
    
    @State var selectedLanguage : Bool = true
    
    
    @State var darkModeOn = false
    
    var body: some View {
        VStack{
            HStack{
                Text("Setting")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal,20)
            Form{
                Section {
                    HStack{
                        Text("Selected Language")
                        Spacer()
                        
                        Button("EN") {
                           appLanguage = "en"
                        }
                        .buttonStyle(DefaultButtonStyle())
                        Button("BN") {
                           appLanguage = "bn"
                        }
                        .buttonStyle(PlainButtonStyle())
                           
                        
                        
                    }
                    
                }
                
                Section("Theme") {
                    Toggle("Dark Mode", isOn: $darkModeOn)
                }
            }
        }
        
    }
    
    func changeLanguage(){
        
    }
}

#Preview {
    SettingsView()
}


