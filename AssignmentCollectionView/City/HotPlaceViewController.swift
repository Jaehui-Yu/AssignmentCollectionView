//
//  HotPlaceViewController.swift
//  AssignmentCollectionView
//
//  Created by Jaehui Yu on 1/11/24.
//

import UIKit

class HotPlaceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigation()
    }
    
    @objc func leftBarButtonClicked() {
        dismiss(animated: true)
    }
}

extension HotPlaceViewController {
    func setNavigation() {
        navigationItem.title = "도시 상세 정보"
        let leftImage = UIImage(systemName: "chevron.backward")
        let leftButton = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(leftBarButtonClicked))
        navigationItem.leftBarButtonItem = leftButton
    }
}
