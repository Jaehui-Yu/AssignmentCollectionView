//
//  ADTableViewCell.swift
//  AssignmentCollectionView
//
//  Created by Jaehui Yu on 1/11/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    static let identifier = "ADTableViewCell"

    @IBOutlet var adBackgroundView: UIView!
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var ad: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        adBackgroundView.backgroundColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 0.5)
        adBackgroundView.layer.cornerRadius = 10
        adBackgroundView.clipsToBounds = true
        
        adLabel.textAlignment = .center
        adLabel.textColor = .black
        
        ad.text = "AD"
        ad.textAlignment = .center
        ad.font = .systemFont(ofSize: 15)
        
        ad.backgroundColor = .white
        ad.layer.cornerRadius = 5
        ad.clipsToBounds = true
    }
    
    func configureCell(data: Travel) {
        adLabel.text = data.title
    }
}
