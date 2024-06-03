//
//  CustomSegmentedPicker.swift
//  BSMovieCenter
//
//  Created by BS00834 on 3/6/24.
//

import SwiftUI

struct CustomSegmentedListPicker: View {
    @Binding var selectedGenres: Set<MovieGenre>
    
    let genres: [MovieGenre]
    let columns: Int
    
    var rows: [[MovieGenre]] {
        Array(stride(from: 0, to: genres.count, by: columns)).map { startIndex in
            let endIndex = min(startIndex + columns, genres.count)
            return Array(genres[startIndex..<endIndex])
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row) { genre in
                        Button(action: {
                            if selectedGenres.contains(genre) {
                                selectedGenres.remove(genre)
                            } else {
                                selectedGenres.insert(genre)
                            }
                        }) {
                            Text(genre.rawValue)
                                .padding()
                                .background(selectedGenres.contains(genre) ? Color.blue : Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                                .font(.caption)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    CustomSegmentedListPicker(selectedGenres: .constant([.action, .animation]), genres: MovieGenre.allCases, columns: 4)
}
