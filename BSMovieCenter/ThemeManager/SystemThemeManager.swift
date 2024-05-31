//
//  SystemThemeManager.swift
//  BSMovieCenter
//
//  Created by BS00834 on 31/5/24.
//

import Foundation
import UIKit

class SystemThemeManager{
    
   static let shared = SystemThemeManager()
    
    private init(){}
    
    func changeTheme(darkMode: Bool){
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { 
            print("Nehi HUa re Baba")
            return }
          windowScene.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
       // UIApplication.shared.windows.first?.overrideUserInterfaceStyle = darkMode ? .dark : .light
    }
    
}
