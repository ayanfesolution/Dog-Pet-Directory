//
//  Utility.swift
//  PetDirectory
//
//  Created by Decagon on 26/03/2022.
//

import UIKit

class TabBarCustom: UITabBar {
    
}

@IBDesignable
class RoundedImageView: UIImageView {
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
}

@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
}

struct ImageProvider: RequestImages {
fileprivate let downloadQueue = DispatchQueue(label: "Images cache", qos: DispatchQoS.background)
//MARK: - Fetch image from URL and Images cache
func loadImages(from url: URL, completion: @escaping (_ image: UIImage) -> Void) {
   downloadQueue.async(execute: { () -> Void in
      do{
         let data = try Data(contentsOf: url)
         if let image = UIImage(data: data) {
            DispatchQueue.main.async { completion(image) }
         } else { print("Could not decode image") }
      }catch { print("Could not load URL: \(url): \(error)") }
   })
  }
}
protocol RequestImages {}
extension RequestImages where Self == ImageProvider{
  func requestImage(from url: URL, completion: @escaping (_ image: UIImage) -> Void){
     //calling here another function and returning data completion
// loadImages(from: url, completion: completion)
  }
}
