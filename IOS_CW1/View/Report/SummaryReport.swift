import SwiftUI

struct FinancialSummaryView: View {
    @State private var summaryData: FinancialSummaryData?
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 16) {
                    Text("Financial Summary")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.top, 16)

                    if isLoading {
                        ProgressView("Loading...")
                            .progressViewStyle(CircularProgressViewStyle())
                            .frame(maxWidth: .infinity, alignment: .center)
                    } else if let data = summaryData {
                        SummaryCard(title: "Total Expenses", value: data.totalExpenses, color: .red)
                        SummaryCard(title: "Total Income", value: data.totalIncome, color: .green)
                        SummaryCard(title: "Total Allocated Amount", value: data.totalAllocatedAmount, color: .blue)
                        SummaryCard(title: "Balance", value: data.balance, color: .purple)

                        if !data.categories.isEmpty {
                            Text("Categories:")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                                .padding(.top, 16)

                            ForEach(data.categories) { category in
                                CategoryRowView(category: category)
                            }
                            .padding(.horizontal, 16)
                        }
                    } else {
                        Text("No data available.")
                            .font(.title)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .onAppear {
            fetchFinancialSummaryData()
        }
    }

    func fetchFinancialSummaryData() {
        isLoading = true
        
        guard let apiUrl = URL(string: "http://localhost:3000/getSummaryReport") else {
            isLoading = false
            return
        }
        
        let requestBody: [String: String] = ["email": "saranga@gmail.com"]
        
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
            }
            
            if let error = error {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                let summaryData = try JSONDecoder().decode(FinancialSummaryData.self, from: data)
                DispatchQueue.main.async {
                    self.summaryData = summaryData
                }
            } catch {
                // Handle error
            }
        }.resume()
    }
}

struct SummaryCard: View {
    let title: String
    let value: Double
    let color: Color

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(color)
            .frame(maxWidth: .infinity, minHeight: 100)
            .overlay(
                VStack {
                    Text(title)
                        .font(.headline)
                        .foregroundColor(.white)
                    Text("\(value)")
                        .font(.title)
                        .foregroundColor(.white)
                }
            )
            .padding(.horizontal)
            .padding(.bottom, 8)
    }
}

struct CategoryRowView: View {
    let category: FinancialSummaryData.Category

    var body: some View {
        HStack {
            Text(category.name)
                .font(.headline)
                .foregroundColor(.black)

            Spacer()

            Text("\(category.allocatedAmount)")
                .font(.headline)
                .foregroundColor(.blue)
        }
        .padding(.vertical, 8)
    }
}



struct FinancialSummaryData: Decodable {
    let totalExpenses: Double
    let totalIncome: Double
    let totalAllocatedAmount: Double
    let balance: Double
    let categories: [Category]

    struct Category: Decodable, Identifiable {
        let _id: String
        let name: String
        let allocatedAmount: Double

        var id: String {
            return _id
        }
    }
}

struct FinancialSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        FinancialSummaryView()
    }
}
