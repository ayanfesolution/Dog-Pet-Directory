//
//  FetchData.swift
//  PetDirectory
//
//  Created by Decagon on 28/03/2022.
//

import Foundation

enum UserError: Error {
    case dataNotAvailable
    case cannotProcessData
    case invalidURL
    case noDataRecieved
}

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
        guard let data = data else {
          return
      }
    
        let jsonData = String.init(data: data, encoding: .ascii)!.data(using: .utf8)
      let decoder = JSONDecoder()
        
        let dogsData = try? decoder.decode([JsonData].self, from: jsonData!)
        completionHandler(dogsData!)
    })
    dataTask.resume()
    }
    private init() {}
}


/*
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
 */

/*
 // Shared Instance
 static let sharedInstance = FetchData()
 func fetchData() {
     guard let url =  URL(string:"urlstring") else {
         return
     }
     
     //    URLSession Goes Here
     URLSession.shared.dataTask(with: url) { data, response, taskError in
         guard let httpResponse = response as? HTTPURLResponse,
               (200..<300).contains(httpResponse.statusCode),
               let data = data else {
             fatalError()
         }
         let decoder = JSONDecoder()
         guard let response = try? decoder.decode("JSONDecoderFileName".self, from: data) else {
             return
         }
         DispatchQueue.main.async {
             self.varName = response.results
         }
     }.resume()
 }
}

 private init() {}
 */
