//  Constans.swift
//  MovideApp-SwiftUI
//  Created by Arif Demirkoparan on 4.05.2023.
import Foundation
enum EndPoint : String {
    case nowPlaying = "movie/now_playing"
    case  popular = "movie/popular"
    case upComing = "movie/upcoming"
    case trending = "trending/movie/day"
}
struct Constans {
    static let shared:Constans = Constans()
    
    var baseURL: String {
        get {
            return "https://api.themoviedb.org/3/"
        }
    }
    var apiKey: String {
        get {
            return "?api_key=f4978555186f68b2724833d834e18caf"
        }
    }
    var imageURL : String {
        get {
            return "https://image.tmdb.org/t/p/original"
        }
    }
    func getURL(_ endPoint:EndPoint) -> String {
        return "\(baseURL)\(endPoint.rawValue)\(apiKey)"
    }
    func getImageURL(_ path:String) -> String {
        return "\(imageURL)\(path)"
    }
}
