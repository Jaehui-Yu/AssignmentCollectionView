//
//  CityViewController.swift
//  AssignmentCollectionView
//
//  Created by Jaehui Yu on 1/9/24.
//

import UIKit
import Kingfisher

class CityViewController: UIViewController {
    
    var originalCity = CityInfo.city
    var city = CityInfo.city {
        didSet {
            cityCollectionView.reloadData()
        }
    }
    
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var cityCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configrueTableView()
        configureSegmentedControl()
        configureSearchBar()
        
    }
    
    @objc func segmentedControlChanged() {
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            city = originalCity.filter { $0.domestic_travel == true }
        case 2:
            city = originalCity.filter { $0.domestic_travel == false}
        default:
            city = originalCity
        }
        searchBar(searchBar, textDidChange: searchBar.text ?? "")
    }
}

extension CityViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return city.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityCollectionViewCell.identifier, for: indexPath) as! CityCollectionViewCell
        let row = city[indexPath.item]
        
        DispatchQueue.main.async {
            cell.imageView.layer.cornerRadius = cell.imageView.frame.height / 2
        }
        cell.configureCell(data: row)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
        
    }
}

extension CityViewController {
    func configrueTableView() {
        
        // XiB
        let xib = UINib(nibName: CityCollectionViewCell.identifier, bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: CityCollectionViewCell.identifier)
        
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

extension CityViewController {
    func configureSegmentedControl() {
        segmentedControl.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
    }
}

extension CityViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            city = selectedCity()
        } else if searchText == "" {
            city = []
        } else {
            city = selectedCity().filter { 
                $0.city_name.lowercased().contains(searchText.lowercased()) ||
                $0.city_english_name.lowercased().contains(searchText.lowercased()) ||
                $0.city_explain.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func selectedCity() -> [City] {
        switch segmentedControl.selectedSegmentIndex {
        case 1:
            return originalCity.filter { $0.domestic_travel == true }
        case 2:
            return originalCity.filter { $0.domestic_travel == false }
        default:
            return originalCity
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
}

extension CityViewController {
    func configureSearchBar() {
        searchBar.delegate = self
    }
}

