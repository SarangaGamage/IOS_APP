//
//  UserLoginScreenView.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct UserLoginScreenView: View {
    @State private var emailAddress = ""
    @State private var password = ""
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("User Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                Image(uiImage: #imageLiteral(resourceName: "ImagesSet"))
                    .resizable()
                    .frame(width: 332, height: 332)

                RegisterTextField(text: $emailAddress, placeholder: "Email address")
                
                RegisterTextField(text: $password, placeholder: "Password")
                
                PrimaryButton(title: "Sign In")
                
                NavigationLink(destination: UserRegistrationScreenView(), label: {
                    HStack {
                        Text("New around here?")
                            .foregroundColor(Color.black)
                        Text("Sign Up")
                            .foregroundColor(Color("PrimaryColor"))
                    }
                })
                
            }
            .padding()
        }
    }
}

struct UserLoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginScreenView()
    }
}
