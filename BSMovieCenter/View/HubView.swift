//
//  HubView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct HubView: View {
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
                Text("WatchList")
                    .tabItem {
                        Image(systemName: "list.dash")
                    }
                
                Text("Setting")
                    .tabItem {
                        Image(systemName: "gearshape")
                    }
                
            }
        }
  
        
    }
}

#Preview {
    HubView()
}
