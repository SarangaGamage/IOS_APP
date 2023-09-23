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
                    let selectedCategory = categoryOptions[selectedCategoryIndex]
                    isPresented = false
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
    }
}



