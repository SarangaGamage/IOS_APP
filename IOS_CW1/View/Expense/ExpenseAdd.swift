//
//  ExpenseAdd.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct ExpenseAdd: View {
    @State private var income: Double = 5000
      @State private var expenses: Double = 3000
      @State private var savings: Double = 2000
      @State private var expenseCategory: String = "" // Expense category
      @State private var expenseAmount: String = ""   // Expense amount
      @State private var expenseDescription: String = "" // Expense description

      var body: some View {
          ScrollView {
              VStack(spacing: 0) {


                  // Expense Tracking Form
                  VStack(spacing: 20) {
                      Text("Add Expense")
                          .font(.title)
                          .foregroundColor(.black)

                      TextField("Category", text: $expenseCategory)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .padding(.horizontal)

                      TextField("Amount", text: $expenseAmount)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .keyboardType(.decimalPad)
                          .padding(.horizontal)

                      TextField("Description", text: $expenseDescription)
                          .textFieldStyle(RoundedBorderTextFieldStyle())
                          .padding(.horizontal)

                      Button(action: {
                          // Add expense logic here
                          if let amount = Double(expenseAmount) {
                              let expense = Expense(date: Date(), category: expenseCategory, amount: amount, description: expenseDescription, location: "Location") // You can update this with actual data
                              expenses += amount // Update the total expenses
                              // Append the expense to your expenses array or database
                          }
                          // Clear the form
                          expenseCategory = ""
                          expenseAmount = ""
                          expenseDescription = ""
                      }) {
                          Text("Add Expense")
                              .font(.title)
                              .foregroundColor(.white)
                              .frame(maxWidth: .infinity)
                              .padding()
                              .background(Color.blue)
                              .cornerRadius(10)
                      }
                  }
                  .padding()
                  .background(Color.white)
                  .cornerRadius(20)
                  .shadow(radius: 5)
                  .padding()
              }
          }
//          .edgesIgnoringSafeArea(.top)
      }
  }


struct ExpenseAdd_Previews: PreviewProvider {
    static var previews: some View {
        ExpenseAdd()
    }
}
