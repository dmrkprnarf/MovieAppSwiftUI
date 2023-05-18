//
//  MovieDetailView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 5.05.2023.
//

import SwiftUI
struct MovieDetailView: View {
    // MARK: - PROPERTY
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var movieDetail:MovieDetail? = nil
    @State private var movieCast:[CastElement] = [CastElement]()
    @State private var runtime:Int = 0
    var movieID:Int
    var btnBack : some View { Button(action: {
        self.presentationMode.wrappedValue.dismiss()
    }) {
        HStack {
            Image(systemName: K.I.arrowIMG)
                .resizable()
                .imageScale(.medium)
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
        }
    }
    }
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    func printSecondsToHoursMinutesSeconds(_ seconds: Int) -> String{
        let (h, m, _) = secondsToHoursMinutesSeconds(seconds)
        return ("\(h)h \(m)min")
    }
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: true) {
            VStack{
                DetailHeaderImage(imageName: movieDetail?.backdrop_path ?? K.unkown)
                ZStack {
                    Color.accentColor.ignoresSafeArea()
                    VStack(alignment: .leading, spacing:24) {
                        VStack(alignment: .leading,spacing: 16) {
                            Spacer(minLength: 0.0)
                            HStack {
                                Text(movieDetail?.title ?? K.unkown).font(.custom(K.F.mulishBold, size: 20))
                                    .foregroundColor(Color(K.C.lblColor))
                                    .frame(minWidth: 0, idealWidth: 198, maxWidth: .infinity, alignment: .topLeading)
                                    .lineLimit(2)
                                Spacer()
                                Image(systemName: K.I.bookMarkIMG)
                                    .foregroundColor(Color(K.C.lblColor))
                            }
                            ImdbView(imdbPoınt: movieDetail?.vote_average ?? 0.0 )
                            HStack {
                                if let genre = movieDetail?.genres {
                                    ForEach(0 ..< genre.count,id: \.self) { item in
                                        CagetoryLabelView(genreName: movieDetail!.genres[item].name )
                                    }
                                }
                            }
                            if let spokenLanguage = movieDetail?.spoken_languages {
                                let totalSecond = runtime * 60
                                let time = printSecondsToHoursMinutesSeconds(totalSecond)
                                ForEach(0..<1) { item in
                                    InfoView(hour: time, language: spokenLanguage[item].name, rating: "PG-13")
                                }
                            }
                        }
                        VStack(alignment: .leading, spacing: 16) {
                            HeadingView(headingText: K.description)
                            Text(movieDetail?.overview ?? K.unkown).font(.custom(K.F.mulishRegular, size: 12))
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color(K.C.colGray))
                        }
                        HStack {
                            HeadingView(headingText: K.cast)
                            NavigationLink(destination: CastListView(movieID: movieID)) {
                                HeadingButtonView()
                            }
                        }
                        VStack {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(alignment: .center, spacing:13){
                                    ForEach(0..<movieCast.count,id:\.self) { item in
                                        if item > movieCast.count - 15 {
                                            NavigationLink(destination: CastDetailView(castId: movieCast[item].id)) {
                                                CastView(imageName: movieCast[item].profile_path ?? "", castName: movieCast[item].character)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal,24)
                }
                .cornerRadius(15)
                .offset(y: -20)
            }
            .edgesIgnoringSafeArea(.all)
            .task {
                MovieMenager.shared.fetchMovieDetail(for: movieID, expain: MovieDetail.self) { movieDetail in
                    self.movieDetail = movieDetail
                    self.runtime = movieDetail.runtime
                }
                MovieMenager.shared.fetchMovieCast(for: movieID, expain: Cast.self) { cast in
                    self.movieCast = cast.cast
                }
            }
        }
        .toolbar(content: {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    print("Ellipsis Button Clicked..")
                }) {
                    Image(systemName: K.I.ellipsisIMG)
                        .foregroundColor(.white)
                }//BUTTON
            }//TOOLBAR
        })
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: btnBack)
        .background(Color.accentColor)
    }
}
// MARK: - PREVIEW
struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movieID: 16)
    }
}
