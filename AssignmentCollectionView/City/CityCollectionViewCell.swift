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
        
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = (UIScreen.main.bounds.width - (20 * 3)) / 4
        
        mainLabel.font = .boldSystemFont(ofSize: 16)
        mainLabel.textAlignment = .center
        
        subLabel.font = .systemFont(ofSize: 12)
        subLabel.textColor = .gray
        subLabel.numberOfLines = 2
        subLabel.textAlignment = .center
    }
    
    func configureCell(city: City) {
        let url = URL(string: city.city_image)
        imageView.kf.setImage(with: url)
        
        mainLabel.text = "\(city.city_name) | \(city.city_english_name)"
        
        subLabel.text = city.city_explain
        
        
    }

}
