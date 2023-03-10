//
//  MovieListView.swift
//  SwiftyMovie
//
//  Created by Thomas Nyuma on 12/25/22.
//

import Foundation
import SwiftUI

struct MovieListView: View {
    @State var movies: [Movie] = TestData.movies
        
        var body: some View {
            List {
                EditButton()
                ForEach (movies, id: \.title) { movie in
                    SingleMovieView(movie: movie)
                }
                .onMove { (source, destination) in
                    self.movies.move(fromOffsets: source, toOffset: destination)
                }
                .onDelete { offsets in
                    self.movies.remove(atOffsets: offsets)
                }
            }
        }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
