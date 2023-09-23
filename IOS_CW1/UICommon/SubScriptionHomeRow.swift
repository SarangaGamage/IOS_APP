//
//  SubScriptionHomeRow.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct SubScriptionHomeRow: View {
    @State var sObj: SubscriptionModel = SubscriptionModel(dict: ["name":"Spotify", "icon":"spotify_logo", "price": "5.99"] )
    var body: some View {
        HStack{
                
            Image(sObj.icon)
                .resizable()
                .frame(width: 40, height: 40)
            
            Text(sObj.name)
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
            
            Spacer()
            
            Text( "$\(sObj.price)" )
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.white)
                
    
            
        }
        .padding(15)
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 64, maxHeight: 64)
        
        .background(Color.gray.opacity( 0.2  ))
        .overlay {
            RoundedRectangle(cornerRadius:  12)
                .stroke(  Color.gray, lineWidth: 1)
        }
        .cornerRadius(12)
    }
}


struct SubScriptionHomeRow_Previews: PreviewProvider {
    static var previews: some View {
        SubScriptionHomeRow()
    }
}
