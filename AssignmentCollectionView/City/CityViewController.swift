//
//  CityViewController.swift
//  AssignmentCollectionView
//
//  Created by Jaehui Yu on 1/9/24.
//

import UIKit
import Kingfisher

class CityViewController: UIViewController {
    
    var cityInfo = CityInfo()
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var cityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
        
        // XiB
        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        // 레이아웃
        let layout = UICollectionViewFlowLayout()
        layout.setLayout()
        cityCollectionView.collectionViewLayout = layout
        
        // dataSource, delegate 연결
        cityCollectionView.dataSource = self
        cityCollectionView.dataSource = self
    }
    
    @objc func segmentedControlChanged() {
        if segmentedControl.selectedSegmentIndex == 1 {
            cityInfo.city = CityInfo().city.filter { $0.domestic_travel == true }
        } else if segmentedControl.selectedSegmentIndex == 2 {
            cityInfo.city = CityInfo().city.filter { $0.domestic_travel == false}
        } else {
            cityInfo.city = CityInfo().city
        }
        cityCollectionView.reloadData()
    }
}
