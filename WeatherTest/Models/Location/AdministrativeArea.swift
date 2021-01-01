//
//  AdministrativeArea.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 30/12/20.
//

import Foundation

// MARK: - AdministrativeArea
struct AdministrativeArea: Codable {
    let englishName: String
    let countryID: String

    enum CodingKeys: String, CodingKey {
        case englishName = "EnglishName"
        case countryID = "CountryID"
    }
}
