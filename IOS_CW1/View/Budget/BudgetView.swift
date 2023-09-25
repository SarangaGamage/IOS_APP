//
//  BudgetView.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct BudgetResponse: Codable {
    let name: String
    let allocatedAmount: Double
    let totalSpent: Double
    let leftAmount: Double
}

struct BudgetView: View {
    @State private var isModalPresented = false
    @State private var budgetData: [BudgetResponse] = []
    @State private var email: String = "saranga@gmail.com"
    @EnvironmentObject var userSessionManager: UserSessionManager

    var body: some View {
        ScrollView {
            Image(uiImage: #imageLiteral(resourceName: "ImagesSet"))
                .resizable()
                .frame(width: 332, height: 332)
                .padding(.top, 80)

            LazyVStack(spacing: 15) {
                ForEach(budgetData, id: \.name) { budgetResponse in
                    BudgetCard(bObj: BudgetModel(dict: [
                        "name": budgetResponse.name,
                        "spendAmount": String(budgetResponse.totalSpent),
                        "totalAmount": String(budgetResponse.allocatedAmount),
                        "leftAmount": String(budgetResponse.leftAmount),
                        "color": Color.black
                    ]))
                }
            }
            .padding(.horizontal, 20)

            Button {
                isModalPresented.toggle()
            } label: {
                HStack {
                    Text("Add new category ")
                        .font(.system(size: 14, weight: .bold))
                    Image("add")
                        .resizable()
                        .frame(width: 14, height: 14)
                }
            }
            .foregroundColor(.gray)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 64, maxHeight: 64)
            .overlay {
                RoundedRectangle(cornerRadius: 16)
                    .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5, 4]))
                    .foregroundColor(.gray.opacity(0.5))
            }
            .cornerRadius(16)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .onTapGesture {
                sendPOSTRequest()
            }
        }
        .background(Color.white)
        .ignoresSafeArea()
        .sheet(isPresented: $isModalPresented, onDismiss: {
            sendPOSTRequest()
        }) {
            NavigationView {
                CategoryAdd(isPresented: $isModalPresented)
                    .navigationBarItems(trailing: Button("Cancel") {
                        isModalPresented = false
                    })
            }
        }
        .onAppear {
            sendPOSTRequest()
        }
    }

    private func sendPOSTRequest() {
        guard let url = URL(string: "http://localhost:3000/getBudget") else {
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let parameters: [String: Any] = ["email": email]
       // let parameters: [String: Any] = ["email": userSessionManager.userEmail]
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            print("Error encoding parameters: \(error.localizedDescription)")
            return
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let budgetData = try JSONDecoder().decode([BudgetResponse].self, from: data)
                    DispatchQueue.main.async {
                        self.budgetData = budgetData
                    }
                } catch {
                    print("Error decoding data: \(error.localizedDescription)")
                }
            } else if let error = error {
                print("Error making POST request: \(error.localizedDescription)")
            }
        }.resume()
    }
}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
            .environmentObject(UserSessionManager())
    }
}
