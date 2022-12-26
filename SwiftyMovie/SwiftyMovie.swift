//
//  SwiftyMovie.swift
//  SwiftyMovie
//
//  Created by Thomas Nyuma on 12/25/22.
//

import SwiftUI

@main
struct SwiftyMovie: App {
  

    var body: some Scene {
        WindowGroup {
            SingleMovieView(movie: TestData.movies[0])
        }
    }
}
