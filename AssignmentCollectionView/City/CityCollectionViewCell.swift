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
    
    func configureCell(data: City) {
        let url = URL(string: data.city_image)
        imageView.kf.setImage(with: url)
        mainLabel.text = data.city_pull_name
        subLabel.text = data.city_explain
    }
}
