// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(DogsData.self, from: jsonData)

//
// To read values from URLs:
//
//   let task = URLSession.shared.welcomeElementTask(with: url) { welcomeElement, response, error in
//     if let welcomeElement = welcomeElement {
//       ...
//     }
//   }
//   task.resume()

import Foundation

struct JsonData: Codable {
    let bredFor: String?
    let breedGroup: BreedGroup?
    let height: Eight
    let id: Int
    let image: Image
    let lifeSpan, name: String
    let origin: String?
    let referenceImageID: String
    let temperament: String?
    let weight: Eight
    let countryCode: CountryCode?
    let welcomeDescription, history: String?

    enum CodingKeys: String, CodingKey {
        case bredFor = "bred_for"
        case breedGroup = "breed_group"
        case height, id, image
        case lifeSpan = "life_span"
        case name, origin
        case referenceImageID = "reference_image_id"
        case temperament, weight
        case countryCode = "country_code"
        case welcomeDescription = "description"
        case history
    }
}

enum BreedGroup: String, Codable {
    case empty = ""
    case herding = "Herding"
    case hound = "Hound"
    case mixed = "Mixed"
    case nonSporting = "Non-Sporting"
    case sporting = "Sporting"
    case terrier = "Terrier"
    case toy = "Toy"
    case working = "Working"
}

enum CountryCode: String, Codable {
    case ag = "AG"
    case au = "AU"
    case us = "US"
}

// MARK: - Eight
struct Eight: Codable {
    let imperial, metric: String
}

// MARK: - Image
struct Image: Codable {
    let height: Int
    let id: String
    let url: String
    let width: Int
}

typealias DogsData = [JsonData]


//// MARK: - JsonData
//struct JsonData: Codable {
//    let breeds: [Breed]
//    let height: Int
//    let id: String
//    let url: String
//    let width: Int
//}
//
//// MARK: - Breed
//struct Breed: Codable {
//    let bredFor, breedGroup, countryCode: String
//    let height: Eight
//    let id: Int
//    let lifeSpan, name, referenceImageID, temperament: String
//    let weight: Eight
//
//    enum CodingKeys: String, CodingKey {
//        case bredFor = "bred_for"
//        case breedGroup = "breed_group"
//        case countryCode = "country_code"
//        case height, id
//        case lifeSpan = "life_span"
//        case name
//        case referenceImageID = "reference_image_id"
//        case temperament, weight
//    }
//}
//
//// MARK: - Eight
//struct Eight: Codable {
//    let imperial, metric: String
//}
//
//typealias DogsData = [JsonData]
//
//// MARK: - Helper functions for creating encoders and decoders
//
//func newJSONDecoder() -> JSONDecoder {
//    let decoder = JSONDecoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        decoder.dateDecodingStrategy = .iso8601
//    }
//    return decoder
//}
//
//func newJSONEncoder() -> JSONEncoder {
//    let encoder = JSONEncoder()
//    if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
//        encoder.dateEncodingStrategy = .iso8601
//    }
//    return encoder
//}
//
//// MARK: - URLSession response handlers
//
//extension URLSession {
//    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.dataTask(with: url) { data, response, error in
//            guard let data = data, error == nil else {
//                completionHandler(nil, response, error)
//                return
//            }
//            completionHandler(try? newJSONDecoder().decode(T.self, from: data), response, nil)
//        }
//    }
//
//    func welcomeTask(with url: URL, completionHandler: @escaping (DogsData?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
//        return self.codableTask(with: url, completionHandler: completionHandler)
//    }
//}
