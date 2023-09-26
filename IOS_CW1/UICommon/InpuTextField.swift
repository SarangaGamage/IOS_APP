//
//  InpuTextField.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct InputTextField: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool?
    
    var body: some View {
        if let isSecure = isSecure, isSecure {
            SecureField(placeholder, text: $text)
                .font(.title3)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50.0)
                .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 0.0)
                .autocapitalization(.none) 
        } else {
            TextField(placeholder, text: $text)
                .font(.title3)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.white)
                .cornerRadius(50.0)
                .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 0.0)
                .autocapitalization(.none)
        }
    }
}



