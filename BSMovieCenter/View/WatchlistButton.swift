//
//  WatchlistButton.swift
//  BSMovieCenter
//
//  Created by BS00834 on 21/5/24.
//

import SwiftUI

struct WatchlistButton: View {
    var body: some View {
        Button(action: {}) {
            Text("Add to Watchlist")
                .foregroundStyle(Color.white)
                .padding(10)
                .font(.subheadline)
                .background(Color(UIColor.systemPurple))
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        }
    }
}

#Preview {
    WatchlistButton()
}
