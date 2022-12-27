//
//  MainDetailView.swift
//  SwiftyMovie
//
//  Created by Thomas Nyuma on 12/25/22.

/*
 The API I used for the json data doesn't have a lot of props for making the UI look satisfactory, so I'll use fixed values.

 I possibly DTL can split the views into files, although imo it's more concise with all three views in this file.
*/

import Foundation
import SwiftUI

struct BottomsDetailView: View {
    let movie: Movie
    
    var body: some View {
        VStack (alignment: .leading, spacing: 16.0) {
                    VStack(alignment: .leading) {
                        Text("Directed by:")
                            .font(.system(size:20))
                            .padding(.bottom, 1)
                            .foregroundColor(.secondary)
                            .bold()
                        Text("Francis Ford Coppola")
                            .font(.headline)
                    }
                    VStack(alignment: .leading) {
                        Text("Cast:")
                            .font(.system(size:20))
                            .padding(.bottom, 1)
                            .foregroundColor(.secondary)
                            .bold()
                        Text("Al Pacino, Marlon Brando, James Caan, Diane Keaton, Robert De Niro, Talia Shire")
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

struct SideDetailView: View {
    @Binding var movie: Movie
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8.0) {

            HStack (alignment: .top) {
                VStack (alignment: .leading, spacing: 8.0) {
                    Text("Release Year")
                        .font(.system(size:18))
                        .foregroundColor(.secondary)
                        .bold()
                    Text("1972" + " , " + "USA")
                        .font(.system(size: 14))

                    Text("Genres:")
                        .font(.system(size:18))
                        .padding(.bottom, 1)
                        .foregroundColor(.secondary)
                        .bold()
                    Text("Action, Crime, Thriller")
                        .font(.system(size: 15))
                        .padding(.trailing)
                    
                    Text("Runtime:")
                        .font(.system(size:18))
                        .padding(.bottom, 1)
                        .foregroundColor(.secondary)
                        .bold()
                    Text("2 hours 55 minutes")
                        .font(.system(size: 15))
                
                }
                .font(.callout)
                .foregroundColor(.secondary)
                .padding(.top, 6)
                Spacer()
                Button(action:{self.movie.is_favorite.toggle()})
                       {
                           Heart(isFilled:  movie.is_favorite)
                        .font(.title)
                }
            }
        }
    }
}

struct MainDetailView: View {
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
                SideDetailView(movie: $movie)
            }
            BottomsDetailView(movie: movie)
            Spacer()
        }
        .padding(.top, 18)
        .padding(.horizontal, 20)
        .navigationBarTitle(movie.title)
    }
}

struct MainDetailView_Previews: PreviewProvider {
    static let movie = TestData.movies[0]
    
    static var previews: some View {
        Group {
            MainDetailView(movie: .constant(movie))
            Group {
                SideDetailView(movie: .constant(movie))
                BottomsDetailView(movie:  movie)
            }
            .padding()
            .previewLayout(.sizeThatFits)
        }
    }
}


