//
//  ContentView.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            WelcomeScreenView() 
        }
        .background(Color("BgColor").edgesIgnoringSafeArea(.all))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


