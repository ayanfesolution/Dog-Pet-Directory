
import Foundation

struct JsonData: Codable {
    let id: Int
    let image: Image
    let name: String

    enum CodingKeys: String, CodingKey {
        case image
        case id
        case name
    }
}

// MARK: - Image
struct Image: Codable {
    let height: Int
    let id: String
    let url: String
    let width: Int
}

typealias DogsData = [JsonData]
