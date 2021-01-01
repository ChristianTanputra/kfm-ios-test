//
//  Temperature.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 31/12/20.
//

import Foundation

// MARK: - Temperature
struct Temperature: Codable {
    let value: Int
    let unit: String
    let unitType: Int

    enum CodingKeys: String, CodingKey {
        case value = "Value"
        case unit = "Unit"
        case unitType = "UnitType"
    }
}
