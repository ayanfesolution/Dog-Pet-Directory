//
//  FetchData.swift
//  PetDirectory
//
//  Created by Decagon on 28/03/2022.
//

import Foundation
struct FetchData {
    // Shared Instance
    static let sharedInstance = FetchData()
    
    func fetchData(completionHandler:@escaping ([JsonData]) -> Void) {
        
    var dogsData = [JsonData]()

    let request = NSMutableURLRequest(url: NSURL(string: "https://api.thedogapi.com/v1/breeds")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                      timeoutInterval: 10.0)

    let session = URLSession.shared
    let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
      if (error != nil) {
        print(error!)
      } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse!)
      }
        if let responseText = String.init(data: data!, encoding: .ascii) {
            let jsonData = responseText.data(using: .utf8)!
            dogsData = try! JSONDecoder().decode([JsonData].self, from: jsonData)
            completionHandler(dogsData)
        }
    })
    dataTask.resume()
    }
    private init() {}
}
