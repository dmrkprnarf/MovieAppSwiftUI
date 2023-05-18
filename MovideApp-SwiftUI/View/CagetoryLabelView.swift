//
//  CagetoryLabelView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 30.04.2023.
//

import SwiftUI
struct CagetoryLabelView: View {
    // MARK: - PROPERTY
    var genreName:String
    // MARK: - BODY
    var body: some View {
        HStack(alignment:.center) {
            Text(verbatim: genreName).font(.custom(K.F.mulishBold, size: 8))
                .foregroundColor(Color(K.C.catLblCol))
                .padding(.vertical,5)
                .padding(.horizontal,5)
                .lineLimit(1)
                .overlay(
                    Capsule(style: .continuous)
                        .stroke(Color(K.C.catLblCol),lineWidth: 0))
                .background(
                    Capsule(style: .continuous)
                        .foregroundColor(Color(K.C.catVCol)))
        }//HSTACK
    }
    
}
// MARK: - PREVIEW
struct CagetoryLabelView_Previews: PreviewProvider {
    static var previews: some View {
        CagetoryLabelView(genreName: "Action")
            .previewLayout(.sizeThatFits)
            .padding()
    }
    
}
