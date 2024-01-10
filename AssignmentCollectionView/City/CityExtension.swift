//
//  CityExtension.swift
//  AssignmentCollectionView
//
//  Created by Jaehui Yu on 1/10/24.
//

import UIKit

extension UIImageView {
    func setImageView() {
        self.contentMode = .scaleAspectFill
    }
}

extension UILabel {
    func setMainLabel() {
        self.font = .boldSystemFont(ofSize: 16)
        self.textAlignment = .center
    }
    
    func setSubLabel() {
        self.font = .systemFont(ofSize: 12)
        self.textColor = .gray
        self.numberOfLines = 2
        self.textAlignment = .center
    }
}

extension UICollectionViewFlowLayout {
    func setLayout() {
        let spacing: CGFloat = 20
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        self.itemSize = CGSize(width: cellWidth / 2, height: cellWidth / 2 + 60)
        self.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
        self.minimumLineSpacing = spacing
        self.minimumInteritemSpacing = spacing
    }
}

extension CityViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityInfo.city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        let row = cityInfo.city[indexPath.item]
        
        DispatchQueue.main.async {
            cell.imageView.layer.cornerRadius = cell.imageView.frame.height / 2
        }
        cell.configureCell(data: row)
        
        return cell
    }
}

extension CityCollectionViewCell: configureCell {
    
    func configureCell(data: City) {
        let url = URL(string: data.city_image)
        imageView.kf.setImage(with: url)
        mainLabel.text = "\(data.city_name) | \(data.city_english_name)"
        subLabel.text = data.city_explain
    }
}
