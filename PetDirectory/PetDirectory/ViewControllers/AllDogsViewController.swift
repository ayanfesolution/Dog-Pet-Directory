//
//  AllDogsViewController.swift
//  PetDirectory
//
//  Created by Decagon on 25/03/2022.
//

import UIKit

class AllDogsViewController: UIViewController {
    
    var selectedGroup = [JsonData](){
        didSet{
            self.selectedGroup = dogsData
        }
    }
    @IBOutlet weak var allDogsTableView: UITableView!
    
    var rowsWhichAreChecked = UserDefaults.standard.array(forKey: "dogFavorite") as? [String] ?? [String]()
    
    
    var dogsData = [JsonData](){
        didSet{
            DispatchQueue.main.async {
                self.allDogsTableView.reloadData()
            }
        }
    }
    
    func fetchDogData() {
        FetchData.sharedInstance.fetchData { [weak self]  dogs in
            self?.dogsData = dogs
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchDogData()
        allDogsTableView.dataSource = self
        
    }
}

extension AllDogsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "allDogsTableCell", for: indexPath) as! AllDogsTableViewCell
        
        let pet = dogsData[indexPath.row]
        cell.dogNameLabel.text = pet.name
        DispatchQueue.main.async {
            let imageProvider = ImageProvider()
            imageProvider.requestImage(from: URL(string:pet.image.url)!) { image in
                cell.dogImageView.image = image
            }
        }
        //MARK: - Changing the image on button after favourite is selected
        if self.rowsWhichAreChecked.contains(pet.name) {
            cell.favouriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        } else {
            cell.favouriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
        //MARK: - Changing the image on button after favourite is selected
        cell.favButtonPressed = { [ weak self ] in
            if self!.rowsWhichAreChecked.contains(pet.name) {
                let removeIdx = self!.rowsWhichAreChecked.lastIndex(where: {$0 == pet.name})
                self!.rowsWhichAreChecked.remove(at: removeIdx!)
                
                cell.favouriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                cell.favouriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
                self!.rowsWhichAreChecked.append(pet.name)
            }
            UserDefaults.standard.set(self?.rowsWhichAreChecked, forKey: "dogFavorite")
            self?.allDogsTableView.reloadData()
        }
        
        return cell
    }
    
    
}
