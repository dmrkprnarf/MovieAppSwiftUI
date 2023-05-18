// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//   let popular = try? JSONDecoder().decode(Popular.self, from: jsonData)
import Foundation
// MARK: - Popular
struct Movie: Codable {
    let results: [MovieResult]
}
// MARK: - Result
struct MovieResult:Identifiable,Codable,Hashable{
    let backdrop_path: String
    let genre_ids: [Int]
    let id: Int
    let original_language, original_title, overview: String
    let popularity: Double
    let poster_path, release_date, title: String
    let video: Bool
    let vote_average: Double
    let vote_count: Int
}

