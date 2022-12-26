//
//  SingleMovieView.swift
//  SwiftyMovie
//
//  Created by Thomas Nyuma on 12/25/22.
//

import SwiftUI

struct SingleMovieView: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: 24.0) {
            AsyncImage(url: URL(string: movie.poster_path)!) { image in
                image
                    .resizable()
                    .frame(width: 110.0, height: 170.0)
                    .shadow(color: .gray, radius: 10.0, x: 4.0, y: 4.0)
            } placeholder: {
                Image(systemName: "photo.fill")
            }

            VStack(alignment: .leading, spacing: 4.0) {
                HStack {
                    Text(movie.title)
                        .font(.headline)
                    Spacer()
                    if movie.is_favorite {
                        Heart(isFilled: true)
                    }
                }
                Text(movie.overview.components(separatedBy: " ").dropLast(
                    movie.overview.split(whereSeparator: { ",.! ".contains($0) }).count - 20
                ).joined(separator: " ") + "...")
                Group {
                    Text("Adventure, Action, Thriller")
                    Text(movie.release_date)
                }
                .font(.caption)
                .foregroundColor(.secondary)
            }
            Spacer()
        }
    }
}

struct SingleMovieView_Previews: PreviewProvider {
    static var previews: some View {
        SingleMovieView(movie: TestData.movies[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
