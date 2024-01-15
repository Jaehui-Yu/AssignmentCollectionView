//
//  City.swift
//  AssignmentCollectionView
//
//  Created by Jaehui Yu on 1/15/24.
//

import Foundation

struct City {
    var city_name: String
    var city_english_name: String
    var city_explain: String
    var city_image: String
    var domestic_travel: Bool
    
    var city_pull_name: String {
        "\(city_name) | \(city_english_name)"
    }
}
