//
//  ImdbView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 4.05.2023.
//

import SwiftUI

struct ImdbView: View {
    // MARK: - PROPERTY
    var imdbPoınt:Double
    // MARK: - BODY
    
    var body: some View {
        HStack(spacing: 2){
            Image(systemName:K.I.starIMG)
                .foregroundColor(Color(K.C.starCol))
                .font(Font.system(size: 12))
            Text("\(String(format: "%.1f",imdbPoınt))/10 IMDb")
                .font(.custom(K.F.mulishRegular, size: 12))
                .foregroundColor(Color(K.C.colGrayLight))
        }//HSTACK
    }
}
// MARK: - PREVIEW
struct ImdbView_Previews: PreviewProvider {
    static var previews: some View {
        ImdbView(imdbPoınt:9.2)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
