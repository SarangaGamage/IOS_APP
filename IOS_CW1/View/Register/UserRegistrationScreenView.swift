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
        ScrollView {
            VStack(spacing: 20) {
                Text("User Registration")
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



struct SocialLoginButton: View {
    var image: Image
    var text: Text
    
    var body: some View {
        VStack {
            HStack {
                image
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.horizontal)
                Spacer()
                text
                    .font(.title2)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(50.0)
        .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 0.0)
        }
        .padding(.bottom, -15)
    }
    
}

struct RegisterTextField: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .font(.title3)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(50.0)
            .shadow(color: Color.black.opacity(0.08), radius: 10, x: 0.0, y: 0.0)
    }
}

