//
//  SettingRowView.swift
//  BSMovieCenter
//
//  Created by BS00834 on 6/6/24.
//

import SwiftUI

struct SettingRowView: View {
    
    let imageName : String
    let title : String
    let tintColor : Color
    
    
    var body: some View {
        HStack{
            Image(systemName: imageName)
                .imageScale(.small)
                .font(.title)
                .foregroundStyle(tintColor)
            
            Text(title)
                .font(.subheadline )
        }    }
}

#Preview {
    SettingRowView(imageName: "star", title: "Dance", tintColor: Color.blue)
}
