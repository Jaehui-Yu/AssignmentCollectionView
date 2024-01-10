//
//  CityCollectionViewCell.swift
//  AssignmentCollectionView
//
//  Created by Jaehui Yu on 1/9/24.
//

import UIKit

class CityCollectionViewCell: UICollectionViewCell {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var subLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.setImageView()
        mainLabel.setMainLabel()
        subLabel.setSubLabel()
    }
}
