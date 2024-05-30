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
    var body: some Scene {
        WindowGroup {
            HubView()
                .environment(\.locale, Locale(identifier: appLanguage))
        }
        
    }
}
