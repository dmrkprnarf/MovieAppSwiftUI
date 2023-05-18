//
//  HorizontalRowListView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 30.04.2023.
//

import SwiftUI

struct HorizontalMovieListView: View {
    // MARK: - PROPERTY
    @State  var nowPlaying:[MovieResult] = []
    // MARK: - BODY
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16){
                ForEach(0..<nowPlaying.count,id: \.self ) { number in
                    if number < nowPlaying.count - 10 {
                        VStack(alignment: .leading, spacing: 5) {
                            CacheAsyncImage(url:URL(string: "\(Constans.shared.getImageURL(nowPlaying[number].poster_path))")!, scale: 1.0, transaction: Transaction(animation: .default)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(minWidth: 0, idealWidth: 143, maxWidth: 143, minHeight: 0, idealHeight: 212, maxHeight: 212, alignment: .center)
                                case .success(let image):
                                    NavigationLink(destination: MovieDetailView(movieID: nowPlaying[number].id)) {
                                        image.iconModifier()
                                            .frame(minWidth: 0, idealWidth: 143, maxWidth: 143, minHeight: 0, idealHeight: 212, maxHeight: 212, alignment: .center)
                                        .cornerRadius(8)
                                    }
                                case .failure(_):
                                    ProgressView()
                                        .frame(minWidth: 0, idealWidth: 143, maxWidth: 143, minHeight: 0, idealHeight: 212, maxHeight: 212, alignment: .center)
                                @unknown default:
                                    ProgressView()
                                }
                            }//ASYNCIMAGE
                            VStack (alignment: .leading,spacing: 5) {
                                Text(nowPlaying[number].title)
                                    .font(.custom(K.F.mulishBold, size: 14))
                                    .lineLimit(2)
                                  
                                ImdbView(imdbPoınt: nowPlaying[number].vote_average)
                            }//VSTACK
                        }//VSTACK
                        .frame(width: 143, height: 283, alignment: .topLeading)
                    }
                }//VSTACK
            }//HSTACK
            .task {
                MovieMenager.shared.fetchMovie(for:Constans.shared.getURL(.nowPlaying), expain: Movie.self) { nowplayings in
                    self.nowPlaying = nowplayings.results
                }
            }
        }//SCROLL
    }
}

// MARK: - PREVIEW
struct HorizontalRowListView_Previews: PreviewProvider {
    static var previews: some View {
        var movies = [MovieResult]()
        HorizontalMovieListView(nowPlaying: movies)
            .previewLayout(.sizeThatFits)
            .padding()
            .task {
                MovieMenager.shared.fetchMovie(for: Constans.shared.getURL(.nowPlaying), expain: Movie.self) { nowPlaying in
                    movies = nowPlaying.results
                }
            }
    }
}
