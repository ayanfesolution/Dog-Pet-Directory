//
//  DogsILikeViewController.swift
//  PetDirectory
//
//  Created by Decagon on 25/03/2022.
//

import UIKit

class DogsILikeViewController: UIViewController {
    
    
    var dogsFav = [JsonData](){
        didSet{
            DispatchQueue.main.async { [self] in
            dogsFav = UserDefaults.standard.object(forKey: "dogFavorite")! as! [JsonData]
                }
        }
    }
//    var dogsFav = [JsonData](){
//        didSet{
//            if (UserDefaults.standard.object(forKey: "dogFavorite") != nil) {
//                DispatchQueue.main.async { [self] in
//                    dogsFav = UserDefaults.standard.object(forKey: "dogFavorite")! as! [JsonData]
//                }
//            }
//        }
//    }
    
    func selectedWorkoutGroup() {
        DispatchQueue.main.async { [self] in
        dogsFav = UserDefaults.standard.object(forKey: "dogFavorite")! as! [JsonData]
        }
    }
    
    @IBOutlet weak var dogsILikeCollectionView: UICollectionView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogsILikeCollectionView.dataSource = self

//        dogsFav = UserDefaults.standard.object(forKey: "dogFavorite")
    }
}

extension DogsILikeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dogsFav.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dogsILikeCollectionViewCell", for: indexPath) as! DogsILikeCollectionViewCell
        
        selectedWorkoutGroup()
        let pets = dogsFav[indexPath.row]
        
        cell.dogNameLabel.text = pets.name
        
        //        cell.dogNameLabel.text = favDogs.name
        //        DispatchQueue.main.async {
        //        let imageProvider = ImageProvider()
        //            imageProvider.requestImage(from: URL(string:favDogs.image.url)!) { image in
        //                cell.dogImageView.image = image
        //            }
        //     }
        
        return cell
    }
}
