//
//  ContentView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 29.04.2023.
//

import SwiftUI
struct Homeview: View {
    
    // MARK: - PROPERTY
    @State  var movie:[MovieResult] = [MovieResult]()
    @State private var popular:[MovieResult] = [MovieResult]()
    @State private var trending:[MovieResult] = [MovieResult]()
    @State private var upComing:[MovieResult] = [MovieResult]()
    // MARK: - BODY
    var body: some View {
        ZStack {
            Color.accentColor.ignoresSafeArea()
            NavigationView {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading,spacing: 5) {
                        Group{
                            VStack(spacing: 10){
                                HStack {
                                    HeadingView(headingText: K.nowShowing)
                                    Spacer()
                                    NavigationLink(destination: MovieListView(movie: movie, navBarTitle: K.nowShowing)) {
                                        HeadingButtonView()
                                    }
                                }
                                HorizontalMovieListView(nowPlaying: movie)
                            }//VSTACK
                        }// NOW SHOWING
                        .padding()
                        Group {
                            VStack(alignment: .leading, spacing: 16) {
                                HStack {
                                    HeadingView(headingText:K.popular)
                                    Spacer()
                                    NavigationLink(destination: MovieListView(movie: popular, navBarTitle: K.popular)) {
                                     HeadingButtonView()
                                    }
                                }
                                ForEach(0..<popular.count,id: \.self) { number in
                                    if number < popular.count - 17 {
                                        VStack(alignment: .leading,spacing: 3) {
                                                VerticalMovieListView(ImageURL: popular[number].backdrop_path, title: popular[number].title, voteAvegare: popular[number].vote_average, movieID: popular[number].id)
                                        }//VSTACK
                                    }
                                }//LOOP
                            }//VSTACK
                        }//POPULAR GROUP
                        .padding()
                        Group {
                            VStack(alignment: .leading, spacing: 15) {
                                HStack {
                                    HeadingView(headingText:K.trending)
                                    Spacer()
                                    NavigationLink(destination: MovieListView(movie: trending, navBarTitle: K.trending)) {
                                     HeadingButtonView()
                                    }
                                }
                                ForEach(0..<trending.count,id: \.self) { number in
                                    if number < trending.count - 17 {
                                        VStack(alignment: .leading,spacing: 3) {
                                            VerticalMovieListView(ImageURL: trending[number].backdrop_path, title: trending[number].title, voteAvegare: trending[number].vote_average,movieID: trending[number].id)
                                        }//VSTACK
                                    }
                                }//LOOP
                            }//VSTACK
                        }//TRENDING GROUP 3
                        .padding()
                        Group {
                            VStack(alignment: .leading, spacing: 15) {
                                HStack {
                                    HeadingView(headingText:K.upComing)
                                    Spacer()
                                    NavigationLink(destination: MovieListView(movie: upComing, navBarTitle: K.upComing)) {
                                     HeadingButtonView()
                                    }
                                }
                                ForEach(0..<upComing.count,id: \.self) { number in
                                    if number < upComing.count - 17 {
                                        VStack(alignment: .leading,spacing: 3) {
                                            VerticalMovieListView(ImageURL: upComing[number].backdrop_path, title: upComing[number].title, voteAvegare: upComing[number].vote_average,movieID: upComing[number].id)
                                        }//VSTACK
                                    }
                                }//LOOP
                            }//VSTACK
                        }//TRENDING GROUP 3
                        .padding()
                    }//VSTACK
                } // SCROLL
                .navigationTitle("Home")
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text(K.movieName).font(.custom(K.F.merriweatherBlack, size: 16))
                    }//TOOLBAR
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("Bell Button Clicked..")
                        }) {
                            Image(systemName:K.I.notificationIMG)
                                .foregroundColor(Color(K.C.genCol))
                        }//BUTTON
                    }//TOOLBAR
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            print("Menu Button Clicked..")
                        }) {
                            Image(systemName: K.I.menuIMG)
                                .foregroundColor(Color(K.C.genCol))
                        }//BUTTON
                    }//TOOLBAR
                }//TOOLBAR
                .navigationBarTitleDisplayMode(.inline)
            }//NAVIGATON
            .navigationViewStyle(.stack)
        }//ZSTACK
        .task {
            MovieMenager.shared.fetchMovie(for: Constans.shared.getURL(.nowPlaying), expain: Movie.self) { nowPlaying in
                self.movie = nowPlaying.results
            }
            MovieMenager.shared.fetchMovie(for: Constans.shared.getURL(.popular), expain: Movie.self) { popular in
                self.popular = popular.results
            }
            MovieMenager.shared.fetchMovie(for: Constans.shared.getURL(.trending), expain: Movie.self) { trending in
                self.trending = trending.results
            }
            MovieMenager.shared.fetchMovie(for: Constans.shared.getURL(.upComing), expain: Movie.self) { upComing in
                self.upComing = upComing.results
            }
        }
    }
}
// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let movies = [MovieResult]()
        Homeview(movie: movies)
    }
}
