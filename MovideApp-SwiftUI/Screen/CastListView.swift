//
//  CastListView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 10.05.2023.
//

import SwiftUI

struct CastListView: View {
    @State private var cast:[CastElement] = [CastElement]()
    var movieID:Int
    var body: some View {
        HStack {
            List(0..<cast.count,id: \.self) { item in
                NavigationLink (destination: CastDetailView(castId: cast[item].id)) {
                    CastRowList(imageURL: cast[item].profile_path ?? "unkown", castName: cast[item].original_name, characterName: cast[item].character, department: cast[item].known_for_department)
                }.buttonStyle(.plain)
                    .padding(.trailing,-32.0)
            }
        }.listStyle(.plain)
            .task {
                MovieMenager.shared.fetchMovieCast(for: movieID, expain: Cast.self) { cast in
                    self.cast = cast.cast
                }
            }
    }
}

struct CastListView_Previews: PreviewProvider {
    static var previews: some View {
        CastListView(movieID: 16)
    }
}
