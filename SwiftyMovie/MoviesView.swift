//
//  MoviesView.swift
//  SwiftyMovie
//
//  Created by Thomas Nyuma on 12/26/22.
//

import Foundation
import SwiftUI

struct MoviesView: View {
    @Binding var movies: [Movie]
    let showOnlyFavorites: Bool

    @State private var deletionOffsets: IndexSet = []
    @State private var isShowingDeleteConfirmation: Bool = false
    
    var body: some View {
        List {
            ForEach (displayedMovies, id: \.title) { movie in
                NavigationLink(destination: MainDetailView(movie: self.$movies[self.index(for: movie)])) {
                    SingleMovieView(movie: movie)
                }
            }
            .onMove { (source, destination) in
                self.movies.move(fromOffsets: source, toOffset: destination)
            }
            .onDelete { offsets in
                self.isShowingDeleteConfirmation = true
                self.deletionOffsets = offsets
            }
        }
        .navigationBarTitle("All Movies")
        .navigationBarItems(trailing: showOnlyFavorites ? nil : EditButton())
        .actionSheet(isPresented: $isShowingDeleteConfirmation) {
            ActionSheet(title: Text("Are You Sure?"), buttons: [
                .destructive(Text("Delete"), action: { self.movies.remove(atOffsets: self.deletionOffsets) }),
                .cancel()
            ])
        }
    }
}

private extension MoviesView {
    var displayedMovies: [Movie] {
        showOnlyFavorites
            ? movies.filter { $0.is_favorite }
            : movies
    }
    
    func index(for movie: Movie) -> Int {
        movies.firstIndex(where: { $0.title == movie.title })!
    }
}

struct MoviesViewPreview_Provider : PreviewProvider {
    static var previews: some View {
        MoviesView(movies: .constant(TestData.movies), showOnlyFavorites: false)
    }
}

