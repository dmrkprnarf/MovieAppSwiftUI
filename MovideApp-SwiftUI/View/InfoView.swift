//
//  InfoView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 5.05.2023.
//

import SwiftUI

struct InfoView: View {
    // MARK: - PROPERTY
    var hour: String
    var language: String
    var rating:String
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 36.33) {
            VStack(alignment: .leading,spacing: 3) {
                Text("Length").font(.custom(K.F.mulishRegular, size: 12))
                    .foregroundColor(Color(K.C.colGray))
                Text(verbatim:"\(hour)").font(.custom(K.F.mulishSemiBold, size: 12))
            }//VSTACK
            VStack(alignment: .leading,spacing: 3) {
                Text("Language").font(.custom(K.F.mulishRegular, size: 12))
                    .foregroundColor(Color(K.C.colGray))
                Text(language).font(.custom(K.F.mulishSemiBold, size: 12))
            }//VSTACK
            VStack(alignment: .leading,spacing: 3) {
                Text("Rating").font(.custom(K.F.mulishRegular, size: 12))
                    .foregroundColor(Color(K.C.colGray))
                Text(rating).font(.custom(K.F.mulishSemiBold, size: 12))
            }//VSTACK
        }//HSTACK
    }
}
// MARK: - PREVIEW
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView(hour: "200", language: "English", rating: "PG-13")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
