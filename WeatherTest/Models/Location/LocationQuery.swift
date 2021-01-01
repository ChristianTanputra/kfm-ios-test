//
//  WelcomeElement.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 30/12/20.
//

import Foundation

// MARK: - LocationQuery
struct LocationQuery: Codable {
    let key, type: String
    let englishName: String
    let country: Country
    let administrativeArea: AdministrativeArea
    let timeZone: TimeZone

    enum CodingKeys: String, CodingKey {
        case key = "Key"
        case type = "Type"
        case englishName = "EnglishName"
        case country = "Country"
        case administrativeArea = "AdministrativeArea"
        case timeZone = "TimeZone"
    }
}
