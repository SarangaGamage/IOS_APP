//
//  BarChart.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI
import Charts

struct ChartsExample: View {
    var body: some View {
        List {
            Chart {
                BarMark(
                    x: .value("Mount", "jan/22"),
                    y: .value("Value", 5)
                )
                BarMark(
                    x: .value("Mount", "fev/22"),
                    y: .value("Value", 4)
                )
                BarMark(
                    x: .value("Mount", "mar/22"),
                    y: .value("Value", 7)
                )
            }
            .frame(height: 250)
        }
    }
}
