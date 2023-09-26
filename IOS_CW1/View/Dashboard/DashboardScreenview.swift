//
//  DashboardScreenview.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI



struct DashboardView: View {
    @State private var expense: Double = 0
    @State private var income: Double = 0
    @State private var saving: Double = 0
    @State private var balance: Double = 0
    @State private var isIncomeAddPresented = false
    @State private var isSavingAddPresented = false
    @State private var test: String = ""
    @EnvironmentObject var userSessionManager: UserSessionManager

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(
                                    colors: [Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), Color(#colorLiteral(red: 0.3882352941, green: 0.3882352941, blue: 0.3882352941, alpha: 0.0))]
                                ),
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )
                        .frame(width: 400, height: 450)
                        .cornerRadius(25)

                    ZStack {
                        ArcShape()
                            .foregroundColor(Color(#colorLiteral(red: 0.937254902, green: 0.537254902, blue: 0.062745098, alpha: 1)))
                        ArcShape(start: 0, end: 230)
                            .foregroundColor(Color(#colorLiteral(red: 0.1960784314, green: 0.1450980392, blue: 0.5568627451, alpha: 1)))
                            .shadow(color: Color.secondary.opacity(0.5), radius: 7)
                    }
                    .frame(width: UIScreen.main.bounds.width * 0.72, height: UIScreen.main.bounds.width * 0.72)
                    .padding(.bottom, 18)

                    VStack {
                        Image("ArcImage")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 150, height: 80)

                        Text(String(balance))
                            .font(.system(size: 40, weight: .semibold))
                            .foregroundColor(.black)

                        Text("This month's balance")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.black)
                    }
                    .padding(.top, -40)

                    VStack {
                        HStack {
                            StatusButton(title: "Add Income", color: Color(#colorLiteral(red: 0.4392156863, green: 1, blue: 0.4941176471, alpha: 1))) {
                                isIncomeAddPresented = true
                                fetchAnalyticsData()
                            }

                            StatusButton(title: "Add Expenses", color: Color(#colorLiteral(red: 1.0, green: 0.6274509804, blue: 0.6274509804, alpha: 1.0))) {
                                // Handle adding expenses here if needed
                            }

                            StatusButton(title: "Add Savings", color: Color(#colorLiteral(red: 0.502, green: 0.549, blue: 1.0, alpha: 1.0))) {
                                isSavingAddPresented = true
                                fetchAnalyticsData()
                            }
                        }
                        .padding(.top, 310)
                    }
                    .padding(.horizontal, 20)
                }

                VStack {
                    FinancialComponentView(title: "Income", amount: income, color: .green)
                    FinancialComponentView(title: "Expenses", amount: expense, color: .red)
                    FinancialComponentView(title: "Savings", amount: saving, color: .blue)
                }
                .padding(.top, 10)
                .padding(.horizontal, 20)
            }
        }.edgesIgnoringSafeArea(.top)
        .sheet(isPresented: $isIncomeAddPresented) {
            IncomeAdd(isPresented: $isIncomeAddPresented, onIncomeAdded: {
                fetchAnalyticsData()
            })
        }
        .sheet(isPresented: $isSavingAddPresented) {
            SavingAdd(isPresented: $isSavingAddPresented, onSavingsAdded: {
                fetchAnalyticsData()
            })
        }
        .onAppear {
            fetchAnalyticsData()
        }
    }

    func fetchAnalyticsData() {
        let url = URL(string: "http://localhost:3000/getAnalytics")!
        let body: [String: Any] = ["email": userSessionManager.userEmail]

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let analyticsData = try JSONDecoder().decode(AnalyticsResponse.self, from: data)
                    DispatchQueue.main.async {
                        expense = analyticsData.expense
                        income = analyticsData.income
                        saving = analyticsData.saving
                        balance = analyticsData.balance
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("API Request Error: \(error)")
            }
        }.resume()
    }
}

struct AnalyticsResponse: Decodable {
    let expense: Double
    let income: Double
    let saving: Double
    let balance: Double
}



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










