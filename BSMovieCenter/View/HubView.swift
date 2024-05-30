//
//  HubView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct HubView: View {
    
    @StateObject var watchListViewModel : WatchListViewModel = WatchListViewModel()
    
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
