//
//  WelcomeScreenView.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct WelcomeScreenView: View {
    @EnvironmentObject var userSessionManager: UserSessionManager
    var body: some View {
        NavigationView {
            ZStack {
                Color("BgColor").edgesIgnoringSafeArea(.all)
                VStack {
               
                    Text("Welcome")
                         .font(.largeTitle)
                         .fontWeight(.bold)
                     
                    Text("Manage Your Finances")
                        .font(.title)
                        .foregroundColor(Color(#colorLiteral(red: 0.1960784314, green: 0.1450980392, blue: 0.5568627451, alpha: 1)))

                    Image(uiImage: #imageLiteral(resourceName: "logo"))
                        .resizable()
                        .frame(width: 200, height: 180)
                        .padding(.bottom, 40)
                        .padding(.top, 40)
                    
                    Text("Expense Manager")
                        .font(.system(size: 22))
                        .foregroundColor(Color(#colorLiteral(red: 0.1960784314, green: 0.1450980392, blue: 0.5568627451, alpha: 1)))
                        .padding(.bottom, 18)
                    
                    ButtonPrimary(title: "Get Started", action: {
                    })
                    
                    NavigationLink(destination: {
                        UserLoginScreenView()
                    }, label: {
                        Text("Sign In")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(Color(#colorLiteral(red: 0.1960784314, green: 0.1450980392, blue: 0.5568627451, alpha: 1)))
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .cornerRadius(50.0)
                            .shadow(color: Color.black.opacity(0.08),radius: 10, x: 0.0, y: 0.0)
                            .padding(.vertical)
                    })
                    
                    
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
            }
        }
    }
}


struct WelcomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreenView()
            .environmentObject(UserSessionManager())
    }
}
