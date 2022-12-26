//
//  MovieInfoBody.swift
//  SwiftyMovie
//
//  Created by Thomas Nyuma on 12/25/22.
//

import Foundation
import SwiftUI

struct MovieInfoBody: View {
    let movie: Movie
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16.0) {
            VStack(alignment: .leading) {
                Text("Release Date:")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(movie.release_date)
                    .font(.headline)
            }
            VStack(alignment: .leading) {
                Text("Overview")
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text(movie.overview)
                    .font(.headline)
            }
            Divider()
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static let movie = TestData.movies[0]
    
    static var previews: some View {
        MovieInfoBody(movie: movie)
            .padding()
            .previewLayout(.sizeThatFits)
        }
    }

