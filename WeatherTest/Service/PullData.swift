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
    var weatherForecast = [WelcomeElement]()

    func fetchAPI(city: String, completion: @escaping (WelcomeElement?, Error?) -> ()) {
        
        let q = city // city query
        let apiKey = "MGCZabTAAvcheDa1fBlJQ6QCncQ1CdHk"
        let urlString = "https://dataservice.accuweather.com/locations/v1/cities/search?apikey=\(apiKey)&q=\(q)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in

            // Check response
            guard let data = data else { return }
            do {
                let weather = try JSONDecoder().decode([WelcomeElement].self, from: data)
                print(weather)
                DispatchQueue.main.async {
                    completion(weather.first, nil)
                }
            } catch let jsonErr {
                print("Failed to decode: ", jsonErr)
            }
        }.resume()
    }
    
}


