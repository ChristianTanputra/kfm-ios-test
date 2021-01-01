//
//  BgImageQuery.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 31/12/20.
//

import Foundation

// MARK: - BgImageQuery
struct BgImageQuery: Codable {
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case results
    }
}
