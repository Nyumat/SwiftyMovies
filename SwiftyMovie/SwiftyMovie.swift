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
            MainView(movies: TestData.movies)
                .environment(\.colorScheme, .dark)
        }
    }
}

