//
//  DogsILikeViewController.swift
//  PetDirectory
//
//  Created by Decagon on 25/03/2022.
//

import UIKit

class DogsILikeViewController: UIViewController {
    
    @IBOutlet weak var dogsILikeCollectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension DogsILikeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dogsILikeCollectionViewCell", for: indexPath) as! DogsILikeCollectionViewCell
        
        return cell
    }
}
