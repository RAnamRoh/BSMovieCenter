//
//  BSMovieCenterApp.swift
//  BSMovieCenter
//
//  Created by BS00834 on 17/5/24.
//

import SwiftUI

@main
struct BSMovieCenterApp: App {
    @State @AppStorage("appLanguage") private var appLanguage : String = "en"
    @AppStorage("darkModeEnabled") var darkModeEnabled : Bool = false
    @State private var colorScheme: ColorScheme = .light
    var body: some Scene {
        WindowGroup {
            LoginView()
//            HubView()
//                .onChange(of: darkModeEnabled, { _, _ in
//                    colorScheme = darkModeEnabled ? .dark : .light
//                })
//                .onAppear{
//                    colorScheme = darkModeEnabled ? .dark : .light
//                }
//                .environment(\.locale, Locale(identifier: appLanguage))
//                .environment(\.colorScheme, colorScheme)
        }
        
    }
}
