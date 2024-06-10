//
//  BSMovieCenterApp.swift
//  BSMovieCenter
//
//  Created by BS00834 on 17/5/24.
//
import Foundation
import SwiftUI
import Firebase

@main
struct BSMovieCenterApp: App {
    
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authViewModel = AuthViewModel()
    
    init(){
    
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
        }
        
        
    }
}
