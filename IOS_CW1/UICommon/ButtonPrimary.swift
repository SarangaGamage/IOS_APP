//
//  ButtonPrimary.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct ButtonPrimary: View {
    var title: String
    var action: () -> Void
    var body: some View {
        Button(action: {
               
                    action()
        }) {
            Text(title)
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color(#colorLiteral(red: 0.1960784314, green: 0.1450980392, blue: 0.5568627451, alpha: 1)))
                .cornerRadius(50)
        }

    }
}
