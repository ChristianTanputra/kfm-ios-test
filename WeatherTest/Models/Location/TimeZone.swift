//
//  TimeZone.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 30/12/20.
//

import Foundation

// MARK: - TimeZone
struct TimeZone: Codable {
    let code: String
    let gmtOffset: Int

    enum CodingKeys: String, CodingKey {
        case code = "Code"
        case gmtOffset = "GmtOffset"
    }
}
