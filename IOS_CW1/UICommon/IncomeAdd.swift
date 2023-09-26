//
//  IncomeAdd.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-25.
//

import SwiftUI

struct IncomeAdd: View {
    @Binding var isPresented: Bool
    @State private var amount = ""
    @State private var messageText = ""
    @State private var isCategoryAdded = false
    @State private var showAlert = false
    @EnvironmentObject var userSessionManager: UserSessionManager
    
    // Add a closure property to handle income added
    var onIncomeAdded: (() -> Void)?

    var body: some View {
        VStack {
            Text("Add Income")
                .font(.title)
                .padding()
            
            Image(uiImage: #imageLiteral(resourceName: "Income"))
                .resizable()
                .frame(width: 200, height: 200)
                .padding()
            
            InputTextField(text: $amount, placeholder: "Add Your Income Amount")
            


            HStack {
                Button(action: {

                    let email = userSessionManager.userEmail
                    guard let amountDouble = Double(amount) else {
                        return
                    }
                    
                    let categoryData: [String: Any] = [
                        "email": email,
                        "amount": amountDouble
                    ]
                    

                    guard let jsonData = try? JSONSerialization.data(withJSONObject: categoryData) else {

                        return
                    }

                    guard let url = URL(string: "http://localhost:3000/addIncome") else {

                        return
                    }

                    var request = URLRequest(url: url)
                    request.httpMethod = "POST"
                    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    request.httpBody = jsonData


                    URLSession.shared.dataTask(with: request) { data, response, error in
                        if let error = error {
                            print("Error: \(error)")
                        } else if let data = data {
                            if let responseJSON = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                if let success = responseJSON["success"] as? Bool, let message = responseJSON["message"] as? String {
                                    DispatchQueue.main.async {
                                        messageText = message
                                        showAlert = true
                                        isCategoryAdded = success
                                        // Call the closure when income is added successfully
                                        onIncomeAdded?()
                                    }
                                }
                            }
                        }
                    }.resume()
                }) {
                    Text("Add")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color(#colorLiteral(red: 0.1960784314, green: 0.1450980392, blue: 0.5568627451, alpha: 1)))
                        .cornerRadius(50)
                }
                .padding()

                Spacer()

                Button(action: {
                    isPresented = false
                }) {
                    Text("Cancel")
                        .font(.title3)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(Color("PrimaryColor"))
                        .frame(maxWidth: .infinity)
                        .background(Color.white)
                        .cornerRadius(50.0)
                        .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 0.0)
                }
                .padding()
            }
            .padding(.horizontal, -15)
        }
        .background(Color.white)
        .cornerRadius(16)
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Message"),
                message: Text(messageText),
                dismissButton: .default(Text("OK")) {
                    if isCategoryAdded {
                        isPresented = false
                    }
                }
            )
        }
    }
}
