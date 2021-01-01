//
//  Country.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 30/12/20.
//

import Foundation

// MARK: - Country
struct Country: Codable {
    let englishName: String

    enum CodingKeys: String, CodingKey {
        case englishName = "EnglishName"
    }
}
