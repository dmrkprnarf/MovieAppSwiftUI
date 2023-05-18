// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//   let movieDetail = try? JSONDecoder().decode(MovieDetail.self, from: jsonData
import Foundation
// MARK: - MovieDetail
struct MovieDetail:Identifiable,Codable{
    let backdrop_path: String
    let genres: [Genre]
    let homepage: String
    let id: Int
    let imdb_id, original_language, original_title, overview: String
    let popularity: Double
    let poster_path: String
    let spoken_languages: [SpokenLanguage]
    let release_date: String
    let revenue, runtime: Int
    let status, tagline, title: String
    let vote_average: Double?
    let vote_count: Int?
}
// MARK: - Genre
struct Genre: Codable{
    let id: Int
    let name: String
}
// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    let english_name, iso_639_1, name: String
}




