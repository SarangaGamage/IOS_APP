//
//  WelcomeScreenView.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct WelcomeScreenView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("BgColor").edgesIgnoringSafeArea(.all)
                VStack {
                    Spacer()
                    Text("Welcome")
                         .font(.largeTitle)
                         .fontWeight(.bold)
                     
                     Text("Manage Your Finances")
                         .font(.title)
                         .foregroundColor(Color("PrimaryColor"))
                    Image(uiImage: #imageLiteral(resourceName: "ImagesSet"))
                        .resizable()
                        .frame(width: 332, height: 332)
                    Spacer()
                    PrimaryButton(title : "Get Started")
                    
                    NavigationLink(destination: {
                        UserLoginScreenView()
                    }, label: {
                        Text("Sign In")
                            .font(.title3)
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(Color("PrimaryColor"))
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
                                .foregroundColor(Color("PrimaryColor"))
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
    }
}
