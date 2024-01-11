//
//  HotPlaceTableViewCell.swift
//  AssignmentCollectionView
//
//  Created by Jaehui Yu on 1/11/24.
//

import UIKit

class HotPlaceTableViewCell: UITableViewCell {
    
    static let identifier = "HotPlaceTableViewCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var posterImageView: UIImageView!
    @IBOutlet var starImageView: [UIImageView]!
    @IBOutlet var saveLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        titleLabel.font = .boldSystemFont(ofSize: 16)
        
        descriptionLabel.numberOfLines = 0
        
        posterImageView.contentMode = .scaleToFill
        posterImageView.layer.cornerRadius = 10
        
        saveLabel.textColor = .gray
        saveLabel.font = .systemFont(ofSize: 15)
    }
    
    func configureCell(data: Travel) {
        titleLabel.text = data.title
        
        descriptionLabel.text = data.description
        
        let url = URL(string: data.travel_image ?? "")
        posterImageView.kf.setImage(with: url)
        
        if let grade = data.grade {
            let star = Int(trunc(grade))
            for i in 0..<starImageView.count {
                if i < star {
                    starImageView[i].image = UIImage(systemName: "star.fill")
                    starImageView[i].tintColor = .yellow
                } else {
                    starImageView[i].image = UIImage(systemName: "star")
                    starImageView[i].tintColor = .gray
                }
            }
        }
        
        if let save = data.save {
            saveLabel.text = "저장 \(save)"
        } else {
            saveLabel.text = ""
        }
    }
}
