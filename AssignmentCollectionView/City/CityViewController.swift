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
        
        configrueTableView()
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
        
    }
}

extension CityViewController {
    func configrueTableView() {
        
        // XiB
        let xib = UINib(nibName: "CityCollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityCollectionViewCell")
        
        // dataSource, delegate 연결
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        // 레이아웃
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 20
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellWidth / 2 + 60)
        layout.sectionInset = UIEdgeInsets(top: 0, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        cityCollectionView.collectionViewLayout = layout
    }
}


