//
//  DetailHeaderImage.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 5.05.2023.
//

import SwiftUI

struct DetailHeaderImage: View {
    // MARK: - PROPERTY
    var imageName:String
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .center){
            CacheAsyncImage(url: URL(string: "\(Constans.shared.getImageURL(imageName))")!, scale: 1.0, transaction: Transaction(animation: .default)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(minWidth: 0, idealWidth: 375,minHeight: 250, idealHeight: 300, maxHeight: .infinity, alignment: .top)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, idealWidth: 375,minHeight: 250, idealHeight: 300, maxHeight: .infinity, alignment: .top)
                case .failure(_):
                    ProgressView()
                        .frame(minWidth: 0, idealWidth: 375,minHeight: 250, idealHeight: 300, maxHeight: .infinity, alignment: .top)
                @unknown default:
                    ProgressView()
                }
            }//ASYNCIMAGE
            ZStack(alignment: .center){
                Circle()
                    .frame(width: 45,height: 45)
                    .foregroundColor(.accentColor)
                Image(systemName: "play.fill")
                    .imageScale(.large)
                    .font(Font.system(size: 16))
            }//ZSTACK
        }//ZSTACK
    }
}
// MARK: - PREVIEW
struct DetailHeaderImage_Previews: PreviewProvider {
    static var previews: some View {
        DetailHeaderImage(imageName: "")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
