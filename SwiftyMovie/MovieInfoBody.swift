//
//  MovieInfoBody.swift
//  SwiftyMovie
//
//  Created by Thomas Nyuma on 12/25/22.

/*
 The API I used for the json data doesn't have a lot of props for making the UI look satisfactory, so I'll use fixed values.

 I possibly DTL can split the views into files, although imo it's more concise with all three views in this file.
*/

import Foundation
import SwiftUI

struct MovieInfoBody: View {
    let movie: Movie
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16.0) {
                    VStack(alignment: .leading) {
                        Text("Directed by:")
                            .font(.system(size:20))
                            .padding(.bottom, 1)
                            .foregroundColor(.secondary)
                            .bold()
                        Text("Christopher Nolan")
                            .font(.headline)
                    }
                    VStack(alignment: .leading) {
                        Text("Cast:")
                            .font(.system(size:20))
                            .padding(.bottom, 1)
                            .foregroundColor(.secondary)
                            .bold()
                        Text("Jenna Ortega, Leonardo Dicaprio, Bella Thorne, Harry Styles, Ben Affleck")
                            .font(.headline)
                    }
            Divider()
                .frame(minHeight: 5)
                        .overlay(Color.blue)
            Text("Overview:")
                .font(.system(size:20))
                .foregroundColor(.secondary)
                .bold()
            Text(movie.overview).font(.system(size: 20))
                }
    }
}

struct SideInfo: View {
    @Binding var movie: Movie
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8.0) {
            Text(movie.title)
            .font(.system(size:20))
            .padding(.bottom, 1)
            .foregroundColor(.secondary)
            .bold()
            HStack (alignment: .top) {
                VStack (alignment: .leading, spacing: 8.0) {
                    Text("Release Year")
                        .font(.system(size:18))
                        .padding(.bottom, 1)
                        .foregroundColor(.secondary)
                        .bold()
                    Text("2022" + " , " + "USA")
                        .font(.system(size: 14))

                    Text("Genres:")
                        .font(.system(size:18))
                        .padding(.bottom, 1)
                        .foregroundColor(.secondary)
                        .bold()
                    Text("Action, Adventure, Comedy, Thriller")
                        .font(.system(size: 15))
                        .padding(.trailing)
                    
                    Text("Runtime:")
                        .font(.system(size:18))
                        .padding(.bottom, 1)
                        .foregroundColor(.secondary)
                        .bold()
                    Text("1 hour 22 minutes")
                        .font(.system(size: 15))
                
                }
                .font(.callout)
                .foregroundColor(.secondary)
                .padding(.top, 6)
                Spacer()
                Button(action: {
                    movie.is_favorite.toggle()
                })
                       {
                    Heart(isFilled: movie.is_favorite)
                        .font(.title)
                }
            }
        }
    }
}

struct DetailsView: View {
    @Binding var movie: Movie
    
    var body: some View {
        VStack(alignment: .leading, spacing: 36.0) {
            HStack (alignment: .top, spacing: 24.0) {
                AsyncImage(url: URL(string: movie.poster_path)!) { image in
                    image
                        .resizable()
                        .frame(width: 150.0, height: 230.0)
                        .shadow(color: Color.blue, radius: 10.0, x: 1.0, y: 1.0)
                } placeholder: {
                    Image(systemName: "photo.fill")
                }
                SideInfo(movie: $movie)
            }
            MovieInfoBody(movie: movie)
            Spacer()
        }
        .padding(.top, 18)
        .padding(.horizontal, 20)
        .navigationBarTitle(movie.title)
    }
}

struct MovieInfoBody_Previews: PreviewProvider {
    static let movie = TestData.movies[0]
    
    static var previews: some View {
        Group {
            DetailsView(movie: .constant(movie))
            Group {
                SideInfo(movie: .constant(movie))
                MovieInfoBody(movie: movie)
            }
            .padding()
            .previewLayout(.sizeThatFits)
        }
    }
}

