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
                                                       "spendAmount": "25.99",
                                                       "totalAmount": "400",
                                                       "leftAmount": "250.01",
                                                       "color": Color.black ] )
    var body: some View {
        
        VStack{
            HStack{
                
      
                
                VStack{
                    Text(bObj.name)
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    Text("$\(bObj.leftAmount) left to spend")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                
                VStack(alignment: .trailing){
                    Text("$\(bObj.spendAmount)")
                        .font(.system(size: 14, weight: .bold))
                        .foregroundColor(.gray)
                        .frame(alignment: .trailing)
                    
                    Text("of $\(bObj.totalAmount)")
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(.black)
                        .frame(alignment: .trailing)
                }
            }
            ProgressView(value: bObj.perSpend, total: 1)
                .tint(Color(#colorLiteral(red: 0.007843137255, green: 0.5098039216, blue: 0.1176470588, alpha: 1)))
                .background(Color(#colorLiteral(red: 0.5098039216, green: 0.007843137255, blue: 0.007843137255, alpha: 1)))

        }
        
        .padding(15)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.gray.opacity( 0.01  ))
        .overlay {
            RoundedRectangle(cornerRadius:  12)
                .stroke(  Color(#colorLiteral(red: 0.502, green: 0.549, blue: 1.0, alpha: 1.0)), lineWidth: 1.5)
        }
        .cornerRadius(12)
    }
}


struct BudgetCard_Previews: PreviewProvider {
    static var previews: some View {
        BudgetCard()
    }
}
