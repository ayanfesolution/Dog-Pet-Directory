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

protocol RequestImages {}
