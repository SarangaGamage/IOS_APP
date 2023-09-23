//
//  UpcomingBillRow.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct UpcomingBillRow: View {
    @State var sObj: SubscriptionModel = SubscriptionModel(dict: ["name":"Spotify", "icon":"spotify_logo", "price": "5.99"] )
    var body: some View {
        HStack{
                
            ZStack{
                
                VStack{
                    Text("JUN")
                        .font(.system(size: 10, weight: .semibold))
                        .foregroundColor(.gray)
                    
                    Text("25")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.white)
                }
                
            }
            .frame(width: 40, height: 40)
            .background(Color.gray.opacity( 0.2  ))
            .overlay {
                RoundedRectangle(cornerRadius:  12)
                    .stroke(  Color.gray, lineWidth: 1)
            }
            .cornerRadius(12)
            
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

struct UpcomingBillRow_Previews: PreviewProvider {
    static var previews: some View {
        UpcomingBillRow()
    }
}
