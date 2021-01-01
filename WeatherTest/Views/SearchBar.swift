//
//  SearchBar.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 01/01/21.
//

import SwiftUI

struct SearchBar: View {
    
    @State private var cityQuery: String = ""
    
    @Binding var city: String
    @Binding var location: LocationQuery?
    @Binding var weather: WeatherQuery?
    @Binding var bg: BgImageQuery?
    
    @Binding var useCelcius: Bool
    
    @Binding var tempNow: Int
    @Binding var unit: String
    @Binding var province: String
    @Binding var country: String
    @Binding var gmtOffset: String
    
    @Binding var firstSearch: Bool
    
    @Binding var bgImage: String
    
    @Binding var rainChance: String
    @Binding var rainNow: String
    @Binding var timeTo: String
    @Binding var timeNow: String
    @Binding var timeFor: String
    @Binding var isDaylight: String
    
    var body: some View {
        HStack {
            TextField("Search City", text: $cityQuery)
                .padding(7)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding()
            Button(action: {
                PullData.shared.fetchLocationAPI(city: cityQuery){(location, err) in
                    if let err = err {
                        print("Unable to fetch: ", err)
                        return
                    }
                    if let location = location {
//                        print(location)
                        self.location = location
                    }
                    PullData.shared.fetchWeatherAPI(cityKey: location?.key ?? ""){(weather, err) in
                        if let err = err {
                            print("Unable to fetch: ", err)
                            return
                        }
                        if let weather = weather {
//                            print(weather)
                            self.weather = weather
                        }
                        PullData.shared.fetchBGAPI(query: weather?.iconPhrase ?? ""){(bg, err) in
                            if let err = err {
                                print("Unable to fetch: ", err)
                                return
                            }
                            if let bg = bg {
//                                print(bg)
                                self.bg = bg
                            }
                            
                            // Background img
                            bgImage = (bg?.results.first?.urls.regular)!
                        }
                        
                        // Take date and time
                        let zFormatter = DateFormatter()
                        zFormatter.dateFormat = "Z"
                        
                        
                        let dateTime = weather?.dateTime
                        if let range = dateTime?.range(of: "T") {
                            let time = dateTime![range.upperBound...]
                            let tempTime = String(time.prefix(5))
                            timeFor = String(tempTime)
                        }
                        
                        // Current time to convert
                        let date = Date()
                        let calendar = Calendar.current
                        let hour = calendar.component(.hour, from: date)
                        let minutes = calendar.component(.minute, from: date)
                        let zString = zFormatter.string(from: date)
                        let currentGMT: Int = (-1*Int("\(zString)")!)/100
                        timeNow = "\(hour+currentGMT+(location?.timeZone.gmtOffset)!):\(minutes)"
                        
                        timeTo = "\(60-minutes) mins"
                        
                        let tempDaylight = weather?.isDaylight
                        if tempDaylight! {
                            isDaylight = "Yes"
                        } else {
                            isDaylight = "No"
                        }
                        
                        // Rain and temperature
                        rainChance = String(weather!.precipitationProbability)
                        let tempRainNow = weather?.hasPrecipitation
                        if tempRainNow! {
                            rainNow = "Yes"
                        } else {
                            rainNow = "No"
                        }
                        if useCelcius {
                            let tempTemp = weather?.temperature.value ?? 0
                            tempNow = (tempTemp-32)*5/9
                            unit = "ºC"
                        } else {
                            tempNow = weather?.temperature.value ?? 0
                            unit = "ºF"
                        }
                    }
                    
                    // Location details
                    city = location?.englishName ?? "City not found"
                    province = location?.administrativeArea.englishName ?? ""
                    country = location?.country.englishName ?? ""
                    firstSearch = true
                    gmtOffset = String((location?.timeZone.gmtOffset)!)
                    if gmtOffset.hasPrefix("-") {} else {
                        gmtOffset = "+\(gmtOffset)"
                    }
                }
            }) {
                Text("Search")
                    .padding(.trailing)
            }
        }
    }
}
