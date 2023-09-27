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
    @State private var registrationStatus: String = ""
    @State private var alertTitle: String = ""
    @State private var showAlert = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("User Registration")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 10)
                
                Image(uiImage: #imageLiteral(resourceName: "logo"))
                    .resizable()
                    .frame(width: 200, height: 180)
                    .padding(.bottom, 40)
                    .padding(.top, 40)

                
                InputTextField(text: $fullName, placeholder: "Full name")
                
                InputTextField(text: $emailAddress, placeholder: "Email address")
                
                InputTextField(text: $password, placeholder: "Password", isSecure: true)
                
                ButtonPrimary(title: "Sign Up", action: {
                    registerUser()
                })

                Text("or sign in using below social logins")
                    .foregroundColor(Color.black.opacity(0.6))
                    .font(.callout)
                    .padding(.top, 10)
                
                SocialLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "AppleLogo")), text: Text("Sign in with Apple"))
                
                SocialLoginButton(image: Image(uiImage: #imageLiteral(resourceName: "GoogleLogo")), text: Text("Sign in with Google"))
                    .padding(.vertical, 10)
            }
            .padding()
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text(alertTitle),
                    message: Text(registrationStatus),
                    dismissButton: .default(Text("OK"))
                )
            }
        }
    }

    func registerUser() {
        guard let url = URL(string: "http://localhost:3000/register") else {
            return
        }
        
        let parameters: [String: Any] = [
            "fullName": fullName,
            "email": emailAddress,
            "password": password
        ]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
        } catch {
            updateRegistrationStatus(status: "Registration failed", title: "Sorry!")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                updateRegistrationStatus(status: "Registration failed", title: "Sorry!")
                return
            }
            
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let success = json?["success"] as? Bool, success == true {
                        emailAddress = ""
                        fullName = ""
                        password = ""
                        if let message = json?["message"] as? String {
                            updateRegistrationStatus(status: message, title: "Success")
                        }
                    } else {
                        if let message = json?["message"] as? String {
                            updateRegistrationStatus(status: message, title: "Sorry!")
                        }
                      
                    }


                } catch {
                    updateRegistrationStatus(status: "Registration failed", title: "Sorry!")
                }
            }
        }.resume()
    }
    
    private func updateRegistrationStatus(status: String, title: String) {
        registrationStatus = status
        alertTitle = title
        showAlert = true
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

