//
//  CastListView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 8.05.2023.
//

import SwiftUI

struct CastRowList: View {
    var imageURL: String
    var castName: String
    var characterName:String
    var department: String
    var body: some View {
        HStack(alignment: .top,spacing: 5){
            CacheAsyncImage(url: URL(string: "\(Constans.shared.getImageURL(imageURL))")!, scale: 1.0, transaction: Transaction(animation: .default)) { phase in
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
                HStack {
                    Text("Name:")
                        .font(.custom(K.F.mulishBold, size: 12))
                        .foregroundColor(Color(K.C.genCol))
                    Text(castName)
                        .font(.custom(K.F.mulishSemiBold, size: 14))
                    .lineLimit(2)
                }
                CagetoryLabelView(genreName: department)
                HStack {
                    Text("Character:")
                        .font(.custom(K.F.mulishBold, size: 12))
                        .foregroundColor(Color(K.C.genCol))
                    Text(characterName)
                        .font(.custom(K.F.mulishSemiBold, size: 14))
                    .lineLimit(2)
                }
            }
        }
    }
}
struct CastRowList_Previews: PreviewProvider {
    static var previews: some View {
       CastRowList(imageURL: "", castName: "Jonh", characterName: "Jonh", department: "Acting" )
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
