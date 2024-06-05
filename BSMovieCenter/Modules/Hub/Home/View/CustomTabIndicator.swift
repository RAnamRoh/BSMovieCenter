//
//  CustomTabIndicator.swift
//  BSMovieCenter
//
//  Created by BS00834 on 23/5/24.
//

import SwiftUI

struct CustomTabIndicator: View {
    let tabs: [Movie]
    @Binding var selectedTab: Int
    let indicatorHeight: CGFloat
    let indicatorColor: Color

    var body: some View {
        HStack {
            ForEach(tabs.indices, id: \.self) { index in
                if selectedTab == index {
                    Capsule()
                        .fill(indicatorColor)
                        .frame(width: 30, height: indicatorHeight)
                } else {
                    Circle()
                        .fill(.gray)
                        .frame(width: 30, height: indicatorHeight)
                }
            }
        }
    }
}

//#Preview {
//    CustomTabIndicator(tabs: Movie.movieArrayExample, selectedTab: <#Binding<Int?>#>,indicatorHeight: 10, indicatorColor: Color.blue)
//}
