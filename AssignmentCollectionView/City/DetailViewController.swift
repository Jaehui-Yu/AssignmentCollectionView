//
//  DetailViewController.swift
//  AssignmentCollectionView
//
//  Created by Jaehui Yu on 1/11/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    var travel = TravelInfo.travel
    
    @IBOutlet var cityTaleView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigation()
        configureTableView()
    }
    
    @objc func leftBarButtonClicked() {
        dismiss(animated: true)
    }
}

extension DetailViewController {
    func setNavigation() {
        navigationItem.title = "도시 상세 정보"
        let leftImage = UIImage(systemName: "chevron.down")
        let leftButton = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(leftBarButtonClicked))
        navigationItem.leftBarButtonItem = leftButton
    }
}

extension DetailViewController {
    func configureTableView() {
        cityTaleView.rowHeight = UITableView.automaticDimension
        
        let hotPlaceXib = UINib(nibName: HotPlaceTableViewCell.identifier, bundle: nil)
        cityTaleView.register(hotPlaceXib, forCellReuseIdentifier: HotPlaceTableViewCell.identifier)
        
        let adXib = UINib(nibName: ADTableViewCell.identifier, bundle: nil)
        cityTaleView.register(adXib, forCellReuseIdentifier: ADTableViewCell.identifier)
        
        cityTaleView.dataSource = self
        cityTaleView.delegate = self
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if travel[indexPath.row].ad {
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            let row = travel[indexPath.row]
            cell.configureCell(data: row)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: HotPlaceTableViewCell.identifier, for: indexPath) as! HotPlaceTableViewCell
            let row = travel[indexPath.row]
            cell.configureCell(data: row)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if travel[indexPath.row].ad {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: ADViewController.identifier) as! ADViewController
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let sb = UIStoryboard(name: "Main", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: HotPlaceViewController.identifier) as! HotPlaceViewController
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }
    }
}


