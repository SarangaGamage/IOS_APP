//
//  UserRegistrationScreenView.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct UserRegistrationScreenView: View {
    @State private var emailAddress = ""
    @State private var fullName = ""
    @State private var password = ""
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                Image(uiImage: #imageLiteral(resourceName: "ImagesSet"))
                    .resizable()
                    .frame(width: 332, height: 332)
                
                RegisterTextField(text: $fullName, placeholder: "Full name")
                
                RegisterTextField(text: $emailAddress, placeholder: "Email address")
                
                RegisterTextField(text: $password, placeholder: "Password")
                
                PrimaryButton(title: "Sign Up")
                
                Text("or sign in using below social logins")
                    .foregroundColor(Color.black.opacity(0.6))
                    .font(.callout)
                    .padding(.top, 10)
                
                SocialLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "AppleLogo")), text: Text("Sign in with Apple"))
                
                SocialLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "GoogleLogo")), text: Text("Sign in with Google"))
                    .padding(.vertical, 10)
            }
            .padding()
        }
    }
}

struct UserRegistrationScreenView_Previews: PreviewProvider {
    static var previews: some View {
        UserRegistrationScreenView()
    }
}
