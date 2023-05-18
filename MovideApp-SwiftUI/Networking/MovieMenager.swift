//
//  MovieMenager.swift
//  MovideApp-SwiftUI
//
//  Created by Arif Demirkoparan on 3.05.2023.
//

import Foundation
class MovieMenager{
    static  let shared:MovieMenager = MovieMenager()
    func fetchMovie<T:Decodable>(for url:String,expain:T.Type,completionHandler: @escaping (T) -> Void){
        guard  let url = URL(string: url) else {fatalError("Movie url error")}
        URLSession.shared.dataTask(with: url) { (data,response, error) in
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let productData = try decoder.decode(T.self, from: data)
                completionHandler(productData)
            }catch {
                let error = error
                print(error)
            }
        }.resume()
    }
    func fetchMovieDetail<T:Decodable>(for movieID:Int,expain:T.Type,completionHandler: @escaping (T) -> Void){
        guard  let url = URL(string: "\(Constans.shared.baseURL)movie/\(movieID)\(Constans.shared.apiKey)") else {fatalError("MovieDetail error")}
        URLSession.shared.dataTask(with: url) { (data,response, error) in
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let productData = try decoder.decode(T.self, from: data)
                completionHandler(productData)
            }catch {
                let error = error
                print(error)
            }
        }.resume()
    }
    func fetchMovieCast<D:Decodable>(for castID:Int,expain:D.Type,completionHandler: @escaping (D) -> Void) {
        guard  let url = URL(string: "\(Constans.shared.baseURL)movie/\(castID)/credits\(Constans.shared.apiKey)") else {fatalError("MovieCast error")}
        print(url)
        URLSession.shared.dataTask(with: url) { (data,response, error) in
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let productData = try decoder.decode(D.self, from: data)
                completionHandler(productData)
            }catch {
                let error = error
                print(error)
            }
        }.resume()
    }
    func fetchCastDetail<D:Decodable>(for castID:Int,expain:D.Type,completionHandler: @escaping (D) -> Void) {
        guard  let url = URL(string: "\(Constans.shared.baseURL)person/\(castID)\(Constans.shared.apiKey)") else {fatalError("MovieCast error")}
        print(url)
        URLSession.shared.dataTask(with: url) { (data,response, error) in
            guard let data = data else {return}
            do {
                let decoder = JSONDecoder()
                let productData = try decoder.decode(D.self, from: data)
                completionHandler(productData)
            }catch {
                let error = error
                print(error)
            }
        }.resume()
    }
}
