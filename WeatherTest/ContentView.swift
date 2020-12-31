//
//  ContentView.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 30/12/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var weather: WelcomeElement?
    
    @State private var cityQuery: String = ""
    @State private var city: String = ""
    @State private var province: String = ""
    @State private var country: String = ""
    
    var body: some View {
        VStack {
            HStack {
                TextField("Search City", text: $cityQuery)
                Button(action: {
                    PullData.shared.fetchAPI(city: cityQuery){(weather, err) in
                        if let err = err {
                            print("Unable to fetch: ", err)
                            return
                        }
                        if let weather = weather {
                            print(weather)
                            self.weather = weather
                        }
                        city = weather?.englishName ?? "City not found"
                        province = weather?.administrativeArea.englishName ?? ""
                        country = weather?.country.englishName ?? ""
                    }
                }) {
                    Text("Search")
                }
            }
            .padding()
            Text(city)
            Text("\(province), \(country)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
