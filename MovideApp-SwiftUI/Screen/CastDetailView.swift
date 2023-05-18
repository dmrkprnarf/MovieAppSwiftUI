//
//  CastDetailView.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 10.05.2023.
//

import SwiftUI

struct CastDetailView: View {
    @State private var castDetail:CastDetail? = nil
    var castId:Int
    var body: some View {
        VStack(spacing: 0){
            CastHeaderImage(imageName: castDetail?.profile_path ?? "5muzSVt66Qxc8KuVbq0phZIN9tj.jpg")
            ZStack(alignment: .center) {
                Color.accentColor.ignoresSafeArea()
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .center,spacing: 5) {
                        HStack(){
                            Text(castDetail?.name.uppercased() ?? "unkown")
                                .font(.custom(K.F.merriweatherBlack, size: 20))
                                .foregroundColor(Color(K.C.lblColor))
                                .multilineTextAlignment(.center)
                        }
                        HStack {
                            VStack(alignment: .leading,spacing: 3){
                                Text("Birtday").font(.custom(K.F.mulishBold, size: 14))
                                Text(castDetail?.birthday ?? "unkown") .font(.custom(K.F.mulishSemiBold, size: 12))
                            }
                            Spacer()
                            VStack(alignment: .trailing,spacing: 3){
                                Text("Place Of Birth").font(.custom(K.F.mulishBold, size: 14))
                                Text(castDetail?.place_of_birth ?? "unkown") .font(.custom(K.F.mulishSemiBold, size: 12))
                            }.padding(.trailing,20)
                        }
                        HeadingView(headingText: "biography".uppercased()).padding(.leading, 142)
                        Text(castDetail?.biography ?? "unkown").padding(.trailing,10).font(.custom(K.F.mulishBold, size: 14))
                    }// VSTACK
                    .padding([.leading,.top],10)
                }
            }//ZSTACK
            .cornerRadius(15)
        }//VSTACK
        .edgesIgnoringSafeArea(.all)
        .background(Color.accentColor)
        .task {
            MovieMenager.shared.fetchCastDetail(for: castId, expain: CastDetail.self) { castDetail in
                self.castDetail = castDetail
            }
        }
    }
}
struct CastDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CastDetailView(castId: 47)
    }
}
