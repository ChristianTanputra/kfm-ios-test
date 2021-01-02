//
//  PullData.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 31/12/20.
//

import Foundation
import SwiftUI

class PullData: NSObject {

    static let shared = PullData()

    func fetchLocationAPI(city: String, completion: @escaping (LocationQuery?, Error?) -> ()) {
    
        // Replace " " with "-" for query
        let tempCity = city.replacingOccurrences(of: " ", with: "-")
        
        // API key
        let apiKey = "MGCZabTAAvcheDa1fBlJQ6QCncQ1CdHk"
        
        
        // Location URL
        let urlStringLocation = "https://dataservice.accuweather.com/locations/v1/cities/search?apikey=\(apiKey)&q=\(tempCity)"
        guard let urlLocation = URL(string: urlStringLocation) else { return }
        
        // Session Location
        URLSession.shared.dataTask(with: urlLocation) { (data, resp, err) in
            // Check response
            guard let data = data else { return }
            do {
                let location = try JSONDecoder().decode([LocationQuery].self, from: data)
//                print(location)
                DispatchQueue.main.async {
                    completion(location.first, nil)
                }
            } catch let jsonErr {
                print("Failed to decode: ", jsonErr)
            }
        }.resume()
    }
    
    func fetchWeatherAPI(cityKey: String, completion: @escaping (WeatherQuery?, Error?) -> ()) {
        
        // API key
        let apiKey = "MGCZabTAAvcheDa1fBlJQ6QCncQ1CdHk"
        
        
        // Weather URL
        let urlStringWeather = "https://dataservice.accuweather.com/forecasts/v1/hourly/1hour/\(cityKey)?apikey=\(apiKey)"
        guard let urlWeather = URL(string: urlStringWeather) else { return }
        
        // Session Weather
        URLSession.shared.dataTask(with: urlWeather) { (data, resp, err) in
            // Check response
            guard let data = data else { return }
            do {
                let weather = try JSONDecoder().decode([WeatherQuery].self, from: data)
//                print(weather)
                DispatchQueue.main.async {
                    completion(weather.first, nil)
                }
            } catch let jsonErr {
                print("Failed to decode: ", jsonErr)
            }
        }.resume()
    }
    
    func fetchBGAPI(query: String, completion: @escaping (BgImageQuery?, Error?) -> ()) {
        
        // Replace " " with "-" for query
        let tempQuery = query.replacingOccurrences(of: " ", with: "-")
        
        // API key
        let apiKey = "CC5twrAHdGL_t7WA6KGdmfj7XdsD_q76VfxbJPcgGFA"
        
        
        // BG URL
        let urlStringBG = "https://api.unsplash.com/search/photos?page=1&per_page=1&query=\(tempQuery)&client_id=\(apiKey)"
        guard let urlBG = URL(string: urlStringBG) else { return }

        
        // Session BG
        URLSession.shared.dataTask(with: urlBG) { (data, resp, err) in
            // Check response
            guard let data = data else { return }
            do {
                let bg = try JSONDecoder().decode(BgImageQuery.self, from: data)
//                print(bg)
                DispatchQueue.main.async {
                    completion(bg, nil)
                }
            } catch let jsonErr {
                print("Failed to decode: ", jsonErr)
            }
        }.resume()
    }
}


