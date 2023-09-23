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
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.blue.opacity(0.5))
                        .frame(width: 400, height: 450)
                        .cornerRadius(25)
                    
                    Image("ArcBg")
                        .resizable()
                        .scaledToFit()
                    
                    ZStack {
                        ArcShape()
                            .foregroundColor(Color.gray.opacity(0.2))
                        
                        ArcShape(start: 0, end: 230)
                            .foregroundColor(Color.blue)
                            .shadow(color: Color.secondary.opacity(0.5), radius: 7)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.72, height: UIScreen.main.bounds.width * 0.72)
                    .padding(.bottom, 18)
                   // .padding(.top, -50)
                    
                    VStack {
                        Image("ArcImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 80)
                        
                        Text("$1,235")
                            .font(.system(size: 40, weight: .semibold))
                            .foregroundColor(.blue)
                        
                        Text("This month bills")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.blue)
                    }
                    .padding(.top, -40)
                    
                    VStack {
                        HStack {
                            StatusButton(title: "Income", value: "12" ,color: .green) {
                                
                            }
                            
                            StatusButton(title: "Expenses", value: "$19.99",color: .red) {
                                
                            }
                            
                            StatusButton(title: "Savings", value: "$5.99",color: .blue) {
                                
                            }
                        }
                      .padding(.top, 310)
                    }
                    .padding(.horizontal, 20)
                }

                VStack {
                    FinancialComponentView(title: "Income", amount: income, color: .green)
                    FinancialComponentView(title: "Expenses", amount: expenses, color: .red)
                    FinancialComponentView(title: "Savings", amount: savings, color: .blue)
                }
                .padding(.top, 50)
                .padding(.horizontal, 20)
            }
        
        
        }
        .edgesIgnoringSafeArea(.top)
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
        .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 0.0)
    }
}


struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}










