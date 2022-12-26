//
//  FullStackSwiftUApp.swift
//  FullStackSwiftU
//
//  Created by Thomas Nyuma on 12/25/22.
//

import SwiftUI

@main
struct SwiftyMovieApp: App {
  

    var body: some Scene {
        WindowGroup {
            Row(movie: TestData.movies[0])
        }
    }
}
