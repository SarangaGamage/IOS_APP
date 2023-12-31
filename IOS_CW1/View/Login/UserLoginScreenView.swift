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
    @State private var loginStatus: String = ""
    @State private var showAlert = false
    @State private var isLoggedIn = false
    @EnvironmentObject var userSessionManager: UserSessionManager
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("User Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)

                    Image(uiImage: #imageLiteral(resourceName: "logo"))
                        .resizable()
                        .frame(width: 200, height: 180)
                        .padding(.bottom, 40)
                        .padding(.top, 40)

                    InputTextField(text: $emailAddress, placeholder: "Email address")

                    InputTextField(text: $password, placeholder: "Password", isSecure: true)

                    ButtonPrimary(title: "Sign In", action: {
                        loginUser()
                    })

                    NavigationLink(destination: NavigationTab(), isActive: $isLoggedIn) {
                        EmptyView()
                    }

                    NavigationLink(destination: UserRegistrationScreenView(), label: {
                        HStack {
                            Text("New around here?")
                                .foregroundColor(Color.black)
                            Text("Sign Up")
                                .foregroundColor(Color.blue)
                        }
                    })
                }
                .padding()
                .alert(isPresented: $showAlert) {
                    Alert(
                        title: Text("Login Status"),
                        message: Text(loginStatus),
                        dismissButton: .default(Text("OK"))
                    )
                }
            }
        }
    }

    func loginUser() {
        guard let url = URL(string: "http://localhost:3000/login") else {
              return
          }

          let parameters: [String: Any] = [
              "email": emailAddress,
              "password": password
          ]

          var request = URLRequest(url: url)
          request.httpMethod = "POST"
          request.addValue("application/json", forHTTPHeaderField: "Content-Type")

          do {
              request.httpBody = try JSONSerialization.data(withJSONObject: parameters)
          } catch {
              updateLoginStatus(status: "Login failed")
              return
          }


        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                updateLoginStatus(status: "Login failed")
                return
            }

            if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let success = json["success"] as? Bool, success == true,
                       let userData = json["data"] as? [String: Any],
                       let userEmail = userData["email"] as? String {
                        userSessionManager.setUserEmail(userEmail)
                        emailAddress = ""
                        password = ""
                        
                        isLoggedIn = true
                    } else {
                        updateLoginStatus(status: "Login failed")
                    }
                } catch {
                    updateLoginStatus(status: "Login failed")
                }
            }

        }.resume()
    }

    private func updateLoginStatus(status: String) {
        loginStatus = status
        showAlert = true
    }
}

struct UserLoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        UserLoginScreenView()
            .environmentObject(UserSessionManager())
    }
}
