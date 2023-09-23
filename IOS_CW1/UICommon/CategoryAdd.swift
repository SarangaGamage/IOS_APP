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

    var body: some View {
        VStack {
            Text("Add a New Category")
                .font(.title)
                .padding()
            
            InputTextField(text: $categoryName, placeholder: "Category Name")
            InputTextField(text: $allocateAmount, placeholder: "Allocate Amount")

            HStack {
                Button(action: {
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
                          .shadow(color: Color.black.opacity(0.08),radius: 10, x: 0.0, y: 0.0)
                          //.padding(.vertical)
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


