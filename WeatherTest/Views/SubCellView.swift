//
//  SubCellView.swift
//  WeatherTest
//
//  Created by Christian Tanputra on 01/01/21.
//

import SwiftUI

struct SubCellView: View {
    
    var title: String
    @Binding var value: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .background(Color(UIColor.systemBlue))
                .opacity(0.5)
            VStack {
                Text("\(value)")
                    .font(.title2)
                    .foregroundColor(.white)
            }
            VStack {
                Spacer()
                Text(title)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}
