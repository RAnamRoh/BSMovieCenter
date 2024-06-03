//
//  CustomSegmentedPicker.swift
//  BSMovieCenter
//
//  Created by BS00834 on 3/6/24.
//

import SwiftUI

struct CustomSegmentedPicker: View {
    @Binding var selectedSort: SortMovieBy
    
    let sortBy: [SortMovieBy]
    let columns: Int
    
    var rows: [[SortMovieBy]] {
        Array(stride(from: 0, to: sortBy.count, by: columns)).map { startIndex in
            let endIndex = min(startIndex + columns, sortBy.count)
            return Array(sortBy[startIndex..<endIndex])
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row) { genre in
                        Button(action: {
                            selectedSort = genre
                        }) {
                            Text(genre.rawValue)
                                .padding()
                                .background(selectedSort == genre ? Color.blue : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CustomSegmentedPicker(selectedSort: .constant(.title), sortBy: SortMovieBy.allCases, columns: 4)
}
