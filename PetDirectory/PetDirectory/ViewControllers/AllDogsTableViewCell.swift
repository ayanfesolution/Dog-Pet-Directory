//
//  AllDogsTableViewCell.swift
//  PetDirectory
//
//  Created by Decagon on 25/03/2022.
//

import UIKit

class AllDogsTableViewCell: UITableViewCell {

    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var dogNameLabel: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
