//
//  HeadingView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 30.04.2023.
//

import SwiftUI

struct HeadingView: View {
    // MARK: - PROPERTY
    let headingText:String
    // MARK: - BODY
    var body: some View {
        HStack {
            Text(headingText).font(.custom(K.F.merriweatherBlack,size: 16))
                .foregroundColor(Color(K.C.genCol))
            Spacer()
        }
    }
}
// MARK: - PREVIEW
struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingText:K.nowPlaying)
            .previewLayout(.sizeThatFits)
            .padding()
            .preferredColorScheme(.light)
    }
}
