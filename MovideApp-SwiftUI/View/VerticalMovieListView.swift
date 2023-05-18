//
//  VerticalRowList.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 30.04.2023.
//

import SwiftUI

struct VerticalMovieListView: View {
    // MARK: - PROPERTY
    var ImageURL: String
    var title: String
    var voteAvegare:Double
    var movieID:Int
    @State private var genres:[Genre] = [Genre]()
    @State private var runtime:Int = 0
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    func printSecondsToHoursMinutesSeconds(_ seconds: Int) -> String{
        let (h, m, _) = secondsToHoursMinutesSeconds(seconds)
        return ("\(h)h \(m)m")
    }
    // MARK: - BODY
    var body: some View {
        return NavigationLink(destination: MovieDetailView(movieID: movieID)) {
            HStack(alignment: .top,spacing: 7) {
                CacheAsyncImage(url: URL(string: "\(Constans.shared.getImageURL(ImageURL))")!, scale: 1.0, transaction: Transaction(animation: .default)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: 85, height: 120, alignment: .center)
                    case .success(let image):
                        image.iconModifier()
                            .frame(width: 85, height: 120, alignment: .center)
                            .cornerRadius(8)
                    case .failure(_):
                        ProgressView()
                            .frame(width: 85, height: 120, alignment:.center)
                            .cornerRadius(8)
                    @unknown default:
                        ProgressView()
                    }
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(title)
                        .font(.custom(K.F.mulishBold, size: 14))
                        .lineLimit(2)
                    ImdbView(imdbPoınt: voteAvegare)
                    HStack(alignment:.center,spacing: 5){
                        ForEach(0..<genres.count,id: \.self) { item in
                            CagetoryLabelView(genreName: genres[item].name)
                        }
                    }
                    HStack(spacing: 5){
                        Image(systemName: K.I.clockIMG)
                            .foregroundColor(Color(K.C.lblColor))
                            .font(Font.system(size: 9.72))
                            .imageScale(.small)
                        let totalSecond = runtime * 60
                        let time = printSecondsToHoursMinutesSeconds(totalSecond)
                        Text(time)
                            .font(.custom(K.F.mulishRegular, size: 12))
                            .foregroundColor(Color(K.C.lblColor))
                    }//HSTACK
                }//VSTACK
            }//HSTACK
            .frame(width: 304,height: 120,alignment: .leading)
            .task {
                MovieMenager.shared.fetchMovieDetail(for: movieID, expain: MovieDetail.self
                ) { movieDetail in
                    self.genres = movieDetail.genres
                    self.runtime = movieDetail.runtime
                }
            }
        }.buttonStyle(.plain)
            .padding(.trailing,-32.0)
    }
}
// MARK: - PREVIEW
struct VerticalRowList_Previews: PreviewProvider {
    static var previews: some View {
        VerticalMovieListView(ImageURL:"nDxJJyA5giRhXx96q1sWbOUjMBI.jpg", title: "Venom Let ThereBe Carnage", voteAvegare: 9.4, movieID: 0)
            .previewLayout(.sizeThatFits)
            .frame(width: 304,height: 120)
            .padding()
    }
}
