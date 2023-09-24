//
//  ExpenseAdd.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI


struct ExpensesAdd: View {
    @Binding var isPresented: Bool
    @State private var selectedCategoryIndex = 0
    @State private var allocateAmount = ""
    @State private var selectedDate = Date()
    @State private var expenseDescription = ""
    @State private var expenseLocation = ""
    @State private var showAlert = false // State variable to control the alert
    
    let categoryOptions = ["Category 1", "Category 2", "Category 3"]

    var body: some View {
        VStack {
            Text("Add a New Expense")
                .font(.title)
                .padding()
            
            Image(uiImage: #imageLiteral(resourceName: "ImagesSet"))
                .resizable()
                .frame(width: 332, height: 332)
            
            HStack {
                Picker("Category", selection: $selectedCategoryIndex) {
                    ForEach(0..<categoryOptions.count, id: \.self) { index in
                        Text(categoryOptions[index])
                            .font(.title)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .cornerRadius(50)
                
                DatePicker("", selection: $selectedDate, in: ...Date(), displayedComponents: .date)
                    .datePickerStyle(DefaultDatePickerStyle())
                    .padding()
            }

            InputTextField(text: $allocateAmount, placeholder: "Amount")

            InputTextField(text: $expenseDescription, placeholder: "Description")
            InputTextField(text: $expenseLocation, placeholder: "Location")

            HStack {
                Button(action: {
                    let expenseData: [String: Any] = [
                        "email": "test",
                        "amount": (allocateAmount as NSString).doubleValue,
                        "location": expenseLocation,
                        "category": categoryOptions[selectedCategoryIndex],
                        "date": "testdate"
                    ]
                    
                    if let jsonData = try? JSONSerialization.data(withJSONObject: expenseData) {
                        guard let url = URL(string: "http://localhost:3000/addExpense") else {
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
                                            print("Expense save failed: \(message)")
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
                        .background(Color("PrimaryColor"))
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
                title: Text("Expense Added Successfully"),
                message: Text("Your expense has been saved successfully."),
                dismissButton: .default(Text("OK")) {
                    isPresented = false
                }
            )
        }
    }
}

