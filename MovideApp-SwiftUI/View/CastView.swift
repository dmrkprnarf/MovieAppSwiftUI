//
//  CastView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 5.05.2023.
//

import SwiftUI
extension Image {
    func imageModifier() -> some View {
        self
            .resizable()
            .scaledToFill()
    }
    func iconModifier() -> some View {
        self
            .imageModifier()
            .cornerRadius(8)
    }
}
struct CastView: View {
    // MARK: - PROPERTY
    var imageName: String
    var castName: String?
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading,spacing: 5){
                CacheAsyncImage(url: URL(string: "\(Constans.shared.getImageURL(imageName))")!, scale: 1.0, transaction: Transaction(animation: .default)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(minWidth: 0, idealWidth: 72,minHeight: 72, idealHeight: 72)
                    case .success(let image):
                        image.resizable()
                            .frame(minWidth: 0, idealWidth: 72,minHeight: 72, idealHeight: 72)
                            .cornerRadius(8)
                    case .failure(_):
                        Image("empty").iconModifier()
                            .frame(minWidth: 0, idealWidth: 72,minHeight: 72, idealHeight: 72)
                            .cornerRadius(8)
                    @unknown default:
                        fatalError("")
                    }//SWITCH
                }// ASYNC IMAGE
                Text(castName ?? "Null").font(.custom(K.F.mulishRegular, size: 12))
                    .foregroundColor(Color(K.C.genCol))
                    .frame(minWidth: 0,idealWidth: 78,minHeight: 30,idealHeight: 30,alignment:.topLeading)
                    .lineLimit(2)
            }//VSTACK
        }//HSTACK
        .frame(width: 72,height: 120)
    }
}
// MARK: - PREVIEW
struct CastView_Previews: PreviewProvider {
    static var previews: some View {
        CastView(imageName: "/Ahc3TWomYakLcbqZRVBDdf3rhMR.jpg", castName: "John")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
