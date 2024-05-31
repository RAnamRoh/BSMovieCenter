//
//  HubView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct HubView: View {
    
    @StateObject var watchListViewModel : WatchListViewModel = WatchListViewModel()
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("darkModeEnabled") var darkModeEnabled : Bool = false
    
    init(){
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
        // correct the transparency bug for Navigation bars
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
    }
    
    var body: some View {
        
        NavigationStack{
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                    }
                SearchMovieView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                    }
                WatchListView()
                    .tabItem {
                        Image(systemName: "list.dash")
                    }
                
                SettingsView()
                    .tabItem {
                        Image(systemName: "gearshape")
                    }
                
            }
            
            
        }
        .environmentObject(watchListViewModel)
        
        
    }
}

#Preview {
    NavigationStack{
        HubView()
    }
    .environmentObject(WatchListViewModel())
    
}
