//
//  HeadingButton.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 5.05.2023.
//

import SwiftUI

struct HeadingButtonView: View {
    // MARK: - PROPERTY
    // MARK: - BODY
    var body: some View {
        Text(K.seeMore).font(.custom(K.F.mulishRegular, size: 10))
            .foregroundColor(Color(K.C.colGray))
            .padding(.vertical,4)
            .padding(.horizontal,4)
            .overlay(
                Capsule(style: .continuous)
                    .stroke(Color(K.C.colGrayLight),lineWidth: 1)
            )
    }
}
// MARK: - PREVIEW
struct HeadingButton_Previews: PreviewProvider {
    static var previews: some View {
        HeadingButtonView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
