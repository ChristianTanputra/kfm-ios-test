//
//  WeatherQuery.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 31/12/20.
//

import Foundation

// MARK: - WeatherQuery
struct WeatherQuery: Codable {
    let dateTime: String
    let epochDateTime, weatherIcon: Int
    let iconPhrase: String
    let hasPrecipitation, isDaylight: Bool
    let temperature: Temperature
    let precipitationProbability: Int
    let mobileLink, link: String

    enum CodingKeys: String, CodingKey {
        case dateTime = "DateTime"
        case epochDateTime = "EpochDateTime"
        case weatherIcon = "WeatherIcon"
        case iconPhrase = "IconPhrase"
        case hasPrecipitation = "HasPrecipitation"
        case isDaylight = "IsDaylight"
        case temperature = "Temperature"
        case precipitationProbability = "PrecipitationProbability"
        case mobileLink = "MobileLink"
        case link = "Link"
    }
}
