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
            RoundedRectangle(cornerRadius: 12)
                .background(Color(UIColor.systemGray2))
                .opacity(0.1)
            VStack {
                Text("\(value)")
                    .font(.title2)
            }
            VStack {
                Spacer()
                Text(title)
                    .padding()
            }
        }
    }
}
