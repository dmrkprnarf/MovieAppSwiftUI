//
//  CastDetail.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 12.05.2023.
//

import Foundation

struct CastDetail:Codable,Hashable{
    let biography:String
    let birthday: String
    let deathday: String?
    let name: String
    let place_of_birth: String
    let profile_path: String
}
