//
//  DashboardScreenview.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI
import Charts

struct DashboardView: View {
    @State private var income: Double = 5000
    @State private var expenses: Double = 3000
    @State private var savings: Double = 2000
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Financial Dashboard")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                FinancialComponentView(title: "Income", amount: income, color: .green)
                FinancialComponentView(title: "Expenses", amount: expenses, color: .red)
                FinancialComponentView(title: "Savings", amount: savings, color: .blue)
                
            }
            .padding()
        }
    }
}


import SwiftUI

struct FinancialComponentView: View {
    var title: String
    var amount: Double
    var color: Color
    
    var formattedAmount: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: amount)) ?? "$0.00"
    }
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(color)
            
            Spacer()
            
            Text(formattedAmount)
                .font(.system(size: 20))
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}










