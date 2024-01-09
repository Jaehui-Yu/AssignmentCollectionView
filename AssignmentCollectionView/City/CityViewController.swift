//
//  CityViewController.swift
//  AssignmentCollectionView
//
//  Created by Jaehui Yu on 1/9/24.
//

import UIKit
import Kingfisher

class CityViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var cityInfo = CityInfo()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityInfo.city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityCollectionViewCell", for: indexPath) as! CityCollectionViewCell
        let row = cityInfo.city[indexPath.item]
        
        cell.configureCell(city: row)
        
        return cell
    }
    
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
        let spacing: CGFloat = 20
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellWidth / 2 + 60)
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
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
