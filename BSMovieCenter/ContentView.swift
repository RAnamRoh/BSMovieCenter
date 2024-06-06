//
//  ContentView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 6/6/24.
//

import SwiftUI

struct ContentView: View {
    
    @State @AppStorage("appLanguage") private var appLanguage : String = "en"
    @AppStorage("darkModeEnabled") var darkModeEnabled : Bool = false
    @State private var colorScheme: ColorScheme = .light
    
    @EnvironmentObject var authViewModel : AuthViewModel
    
    var body: some View {
        Group{
            
            if authViewModel.userSession != nil {
                            HubView()
                               
            }else {
                LoginView()
            }

        }
        .onChange(of: darkModeEnabled, { _, _ in
            colorScheme = darkModeEnabled ? .dark : .light
        })
        .onAppear{
            colorScheme = darkModeEnabled ? .dark : .light
        }
        .environment(\.locale, Locale(identifier: appLanguage))
        .environment(\.colorScheme, colorScheme)
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
}
