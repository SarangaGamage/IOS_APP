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

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Text("User Login")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)

                    Image(uiImage: #imageLiteral(resourceName: "ImagesSet"))
                        .resizable()
                        .frame(width: 332, height: 332)

                    InputTextField(text: $emailAddress, placeholder: "Email address")

                    InputTextField(text: $password, placeholder: "Password")

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
                                .foregroundColor(Color("PrimaryColor"))
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
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    if let success = json?["success"] as? Bool, success == true {
                        emailAddress = ""
                        password = ""
                        isLoggedIn = true
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
    }
}


//struct UserLoginScreenView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserLoginScreenView()
//    }
//}
