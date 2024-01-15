//
//  UILabel+Extension.swift
//  AssignmentCollectionView
//
//  Created by Jaehui Yu on 1/15/24.
//

import UIKit

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
