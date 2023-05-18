//
//  CastHeaderImage.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 12.05.2023.
//

import SwiftUI

struct CastHeaderImage: View {
    var imageName: String
    var body: some View {
        ZStack(alignment: .center) {
            CacheAsyncImage(url: URL(string: "\(Constans.shared.getImageURL(imageName))")!, scale: 10.0, transaction: Transaction(animation: .default)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(minWidth: 0, idealWidth: 375,maxWidth:.infinity, minHeight: 200, idealHeight: 250, maxHeight: .infinity, alignment: .center)
                case .success(let image):
                    image
                        .resizable()
                        .imageScale(.small)
                        .frame(minWidth: 0, idealWidth: 375,minHeight: 250, idealHeight: 300, maxHeight: .infinity, alignment: .top)
                       
                case .failure(_):
                    ProgressView()
                        .frame(minWidth: 0, idealWidth: 375,maxWidth:.infinity, minHeight: 200, idealHeight: 250, maxHeight: .infinity, alignment: .center)
                @unknown default:
                    ProgressView()
                }
            }//ASYNCIMAGE
        }
    }
}

struct CastHeaderImage_Previews: PreviewProvider {
    static var previews: some View {
        CastHeaderImage(imageName: "5muzSVt66Qxc8KuVbq0phZIN9tj.jpg")
    }
}
