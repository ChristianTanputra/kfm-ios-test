//
//  MainCellView.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 31/12/20.
//

import SwiftUI

struct MainCellView: View {
    
    @Binding var tempNow: Int
    @Binding var unit: String
    @Binding var city: String
    @Binding var province: String
    @Binding var country: String
    @Binding var timeNow: String
    @Binding var icon: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .background(Color(UIColor.systemBlue))
                .opacity(0.5)
            VStack {
                // Icon image are taken directly from assets as URL is not given, and was advised not to pull from their website
                Image("\(icon)")
                Text("\(tempNow) \(unit)")
                    .font(.title2)
                    .foregroundColor(.white)
                Text(city)
                    .foregroundColor(.white)
                Text("\(province), \(country)")
                    .foregroundColor(.white)
                Text("\(timeNow)")
                    .foregroundColor(.white)
            }
        }
    }
}
