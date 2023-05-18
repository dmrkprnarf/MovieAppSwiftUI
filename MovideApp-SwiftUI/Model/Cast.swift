// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//   let cast = try? JSONDecoder().decode(Cast.self, from: jsonData)
import Foundation
// MARK: - Cast
struct Cast: Codable{
    let cast: [CastElement]
}
// MARK: - CastElement
struct CastElement:Identifiable,Codable,Hashable{
    var id: Int
    let original_name: String
    let profile_path:String?
    let character:String
    let known_for_department:String
}

