//
//  BSMovieCenterApp.swift
//  BSMovieCenter
//
//  Created by BS00834 on 17/5/24.
//
import Foundation
import SwiftUI
import Firebase
import AVFoundation
import MediaPlayer

@main
struct BSMovieCenterApp: App {
    
    //@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authViewModel = AuthViewModel()
    
    @Environment(\.scenePhase) private var scenePhase
    
    init(){
        
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(authViewModel)
                .onAppear {
                    //setupAudioSession()
                    //setupRemoteCommandCenter()
                    //setupNowPlayingInfo(title: "Dummy Title", artist: "Channel Name", artworkImage: nil)
                }
//                .onChange(of: scenePhase) { oldValue, newPhase in
//                    if newPhase == .background {
//                        print("App in background")
//                        // Handle any background-specific logic
//                    } else if newPhase == .active {
//                        print("App in active state")
//                    }
//                }
        }
        
        
    }
    
    
    // Configure Audio Session for background playback
    func setupAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Failed to set up audio session: \(error)")
        }
    }
    
    // Setup Lock Screen Now Playing Info
    func setupNowPlayingInfo(title: String, artist: String, artworkImage: UIImage?) {
        let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
        
        var nowPlayingInfo = [String: Any]()
        nowPlayingInfo[MPMediaItemPropertyTitle] = title
        nowPlayingInfo[MPMediaItemPropertyArtist] = artist
        nowPlayingInfo[MPNowPlayingInfoPropertyIsLiveStream] = false
        
        if let image = artworkImage {
            let artwork = MPMediaItemArtwork(boundsSize: image.size) { _ in image }
            nowPlayingInfo[MPMediaItemPropertyArtwork] = artwork
        }
        
        nowPlayingInfoCenter.nowPlayingInfo = nowPlayingInfo
    }
    
    // Configure remote command center for lock screen controls
    func setupRemoteCommandCenter() {
        let commandCenter = MPRemoteCommandCenter.shared()
        
        commandCenter.playCommand.isEnabled = true
        commandCenter.pauseCommand.isEnabled = true
        
        commandCenter.playCommand.addTarget { event in
            // Handle Play Command
            NotificationCenter.default.post(name: NSNotification.Name("PlayVideo"), object: nil)
            return .success
        }
        
        commandCenter.pauseCommand.addTarget { event in
            // Handle Pause Command
            NotificationCenter.default.post(name: NSNotification.Name("PauseVideo"), object: nil)
            return .success
        }
    }
    
    
    
}
