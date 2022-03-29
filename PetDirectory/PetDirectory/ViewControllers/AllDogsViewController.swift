//
//  AllDogsViewController.swift
//  PetDirectory
//
//  Created by Decagon on 25/03/2022.
//

import UIKit

class AllDogsViewController: UIViewController {
    
    @IBOutlet weak var allDogsTableView: UITableView!
    
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
        
        return cell
    }
    
    
}
