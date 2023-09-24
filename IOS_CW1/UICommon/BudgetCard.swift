//
//  BudgetCard.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct BudgetCard: View {
    @State var bObj: BudgetModel = BudgetModel(dict: [ "name": "Auto & Transport",
                                                       "icon": "auto_&_transport",
                                                       "spend_amount": "25.99",
                                                       "total_amount": "400",
                                                       "left_amount": "250.01",
                                                       "color": Color.black ] )
    var body: some View {
        
        VStack{
            HStack{
                
      
                
                VStack{
                    Text(bObj.name)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text("$\(bObj.left_amount) left to spend")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                
                VStack(alignment: .trailing){
                    Text("$\(bObj.total_amount)")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.white)
                        .frame(alignment: .trailing)
                    
                    Text("of $\(bObj.left_amount)")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.gray)
                        .frame(alignment: .trailing)
                }
            }
            ProgressView(value: bObj.perSpend, total: 1)
                .tint(Color.green)
                .background(Color.red)
        }
        
        .padding(15)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.gray.opacity( 0.2  ))
        .overlay {
            RoundedRectangle(cornerRadius:  12)
                .stroke(  Color.gray, lineWidth: 1)
        }
        .cornerRadius(12)
    }
}


struct BudgetCard_Previews: PreviewProvider {
    static var previews: some View {
        BudgetCard()
    }
}