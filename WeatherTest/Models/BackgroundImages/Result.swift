//
//  Result.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 31/12/20.
//

import Foundation

// MARK: - Result
struct Result: Codable {
    let width, height: Int
    let urls: Urls

    enum CodingKeys: String, CodingKey {
        case width, height
        case urls
    }
}
