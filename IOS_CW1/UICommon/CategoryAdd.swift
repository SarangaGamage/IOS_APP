//
//  CategoryAdd.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct CategoryAdd: View {
    @Binding var isPresented: Bool
    @State private var categoryName = ""
    @State private var allocateAmount = ""
    @State private var showAlert = false
    @EnvironmentObject var userSessionManager: UserSessionManager

    var body: some View {
        VStack {
            Text("Add a New Category")
                .font(.title)
                .padding()

            InputTextField(text: $categoryName, placeholder: "Category Name")
            InputTextField(text: $allocateAmount, placeholder: "Allocate Amount")

            HStack {
                Button(action: {
                    let categoryData: [String: Any] = [
                        "email": "saranga@gmail.com",
                       // "email": userSessionManager.userEmail,
                        "name": categoryName,
                        "allocatedAmount": (allocateAmount as NSString).doubleValue
                    ]

                    if let jsonData = try? JSONSerialization.data(withJSONObject: categoryData) {
                        guard let url = URL(string: "http://localhost:3000/addCategory") else {
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
                                        if success {
                                            showAlert = true
                                        } else {
                                            print("Category save failed: \(message)")
                                        }
                                    }
                                }
                            }
                        }.resume()
                    }
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
                title: Text("Category Added Successfully"),
                message: Text("Your category has been saved successfully."),
                dismissButton: .default(Text("OK")) {
                    isPresented = false
                }
            )
        }
    }
}
