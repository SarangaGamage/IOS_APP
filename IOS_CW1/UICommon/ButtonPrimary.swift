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
                .background(Color("PrimaryColor"))
                .cornerRadius(50)
        }

    }
}
