//
//  ContentView.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 30/12/20.
//

import Foundation
import SwiftUI

struct ContentView: View {
    
    @State private var location: LocationQuery?
    @State private var weather: WeatherQuery?
    @State private var bg: BgImageQuery?
    
    @State private var city: String = ""
    @State private var province: String = ""
    @State private var country: String = ""
    @State private var gmtOffset: String = ""
    
    @State private var tempNow: Int = 0
    @State private var unit: String = "F"
    
    @State private var useCelcius: Bool = false
    
    @State private var firstSearch: Bool = false
    
    @State private var bgImage: String = ""
    
    @State private var rainChance: String = ""
    @State private var rainNow: String = ""
    @State private var timeTo: String = ""
    @State private var timeNow: String = ""
    @State private var timeFor: String = ""
    
    @State private var isDaylight: String = ""
    
    var body: some View {
        ZStack {
            
//            Image(uiImage: UIImageView.load(url: URL(string: bgImage)))
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
        
        NavigationView {
            VStack {
                SearchBar(city: $city, location: $location, weather: $weather, bg: $bg, useCelcius: $useCelcius, tempNow: $tempNow, unit: $unit, province: $province, country: $country, gmtOffset: $gmtOffset, firstSearch: $firstSearch, bgImage: $bgImage, rainChance: $rainChance, rainNow: $rainNow, timeTo: $timeTo, timeNow: $timeNow, timeFor: $timeFor, isDaylight: $isDaylight)
                Toggle(isOn: $useCelcius) {
                    Text("Use Celcius")
                }
                .padding(.horizontal)
                
                ScrollView {
                    VStack {
                        Text("Search for a city to start")
                            .font(.title)
                            .opacity(firstSearch ? 0 : 1)
                        
                        VStack {
                            MainCellView(tempNow: $tempNow, unit: $unit, city: $city, province: $province, country: $country, timeNow: $timeNow)
                                .frame(width: UIScreen.main.bounds.width/2, height: UIScreen.main.bounds.width/2, alignment: .center)
                                .padding()
                            HStack {
                                SubCellView(title: "% of Rain", value: $rainChance)
                                    .frame(width: UIScreen.main.bounds.width/3-12, height: UIScreen.main.bounds.width/3-12, alignment: .center)
                                    .padding(.leading)
                                SubCellView(title: "Forecast in", value: $timeTo)
                                    .frame(width: UIScreen.main.bounds.width/3-12, height: UIScreen.main.bounds.width/3-12, alignment: .center)
                                SubCellView(title: "Raining Now", value: $rainNow)
                                    .frame(width: UIScreen.main.bounds.width/3-12, height: UIScreen.main.bounds.width/3-12, alignment: .center)
                                    .padding(.trailing)
                            }
                            HStack {
                                SubCellView(title: "GMT Offset", value: $gmtOffset)
                                    .frame(width: UIScreen.main.bounds.width/3-12, height: UIScreen.main.bounds.width/3-12, alignment: .center)
                                    .padding(.leading)
                                SubCellView(title: "Forecast for", value: $timeFor)
                                    .frame(width: UIScreen.main.bounds.width/3-12, height: UIScreen.main.bounds.width/3-12, alignment: .center)
                                SubCellView(title: "Daylight", value: $isDaylight)
                                    .frame(width: UIScreen.main.bounds.width/3-12, height: UIScreen.main.bounds.width/3-12, alignment: .center)
                                    .padding(.trailing)
                            }
                        }.opacity(firstSearch ? 1 : 0)
                    }
                }
                
                Spacer()
            }
            .navigationBarTitle("Weather")
        }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
