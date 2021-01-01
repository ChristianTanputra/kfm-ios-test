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
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .background(Color(UIColor.systemGray2))
                .opacity(0.1)
            VStack {
                Text("\(tempNow) \(unit)")
                    .font(.title2)
                Text(city)
                Text("\(province), \(country)")
                Text("\(timeNow)")
            }
        }
    }
}
