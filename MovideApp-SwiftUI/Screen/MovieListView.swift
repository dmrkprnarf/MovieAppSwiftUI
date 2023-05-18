//
//  DetailView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 5.05.2023.
//

import SwiftUI

struct MovieListView: View {
    // MARK: - PROPERTY
    @State private var showNavigationBar = true
    var movie:[MovieResult]
    var navBarTitle:String
    // MARK: - BODY
    var body: some View {
            List(0..<movie.count,id: \.self) { item in
                NavigationLink(destination: MovieDetailView(movieID: movie[item].id)) {
                    VerticalMovieListView(ImageURL: movie[item].backdrop_path, title: movie[item].title, voteAvegare: movie[item].vote_average, movieID: movie[item].id)
                }.padding(.trailing, -32.0)
            }.listStyle(.plain)
            .navigationTitle(navBarTitle).font(.custom(K.F.merriweatherBlack, size: 16))
        .background(Color.accentColor)
    }
}
// MARK: - PREVIEW
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movie:[MovieResult] = [MovieResult]()
        MovieListView(movie: movie, navBarTitle: "Now Playing")
    }
}
