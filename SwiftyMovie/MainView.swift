//
//  MainView.swift
//  SwiftyMovie
//
//  Created by Thomas Nyuma on 12/26/22.
//

import Foundation
import SwiftUI

struct MainView: View {
    @State var movies: [Movie] = TestData.movies
    
    var body: some View {
        NavigationView {
            TabView {
                NavigationView {
                    MoviesView(movies:  $movies, showOnlyFavorites:  false)
                }
                .tabItem {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 26))
                    Text("All Movies")
                }
                NavigationView {
                    MoviesView(movies:  $movies, showOnlyFavorites: true)
                }
                .tabItem {
                    Image(systemName: "heart")
                        .font(.system(size: 26))
                    Text("Favorites")
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environment(\.colorScheme, .dark)
    }
}
