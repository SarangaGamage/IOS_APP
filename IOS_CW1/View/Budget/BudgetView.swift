//
//  BudgetView.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct BudgetView: View {
    @State private var isModalPresented = false
    @State var listArr: [BudgetModel] = [
        BudgetModel(dict: [ "name": "Auto & Transport",
                        //    "icon": "auto_&_transport",
                            "spend_amount": "25.99",
                            "total_amount": "400",
                            "left_amount": "0.01"] ),
        
        BudgetModel(dict: [ "name": "Entertainment",
                           // "icon": "entertainment",
                            "spend_amount": "50.99",
                            "total_amount": "600",
                            "left_amount": "10.01"]),
        
        BudgetModel(dict: [ "name": "Security",
                          //  "icon": "security",
                            "spend_amount": "550.99",
                            "total_amount": "600",
                            "left_amount": "250.01"])
                       
    ]
    
 
    var body: some View {
            ScrollView {
                
                Image(uiImage: #imageLiteral(resourceName: "ImagesSet"))
                    .resizable()
                    .frame(width: 332, height: 332)
                    .padding(.top, 80)
                
                
                LazyVStack(spacing: 15) {
                    ForEach( listArr , id: \.id) { bObj in
                        
                        BudgetCard(bObj: bObj)
                        
                    }
                }
                .padding(.horizontal, 20)
                
                
                Button {
                    isModalPresented.toggle()
                } label: {
                    HStack {
                        Text("Add new category ")
                            .font(.system(size: 14, weight: .bold))
                        
                        Image("add")
                            .resizable()
                            .frame(width: 14, height: 14)
                    }
                }
                .foregroundColor(.gray)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 64, maxHeight: 64)
                
                
                .overlay {
                    RoundedRectangle(cornerRadius:  16)
                        .strokeBorder(style: StrokeStyle(lineWidth: 1, dash: [5,4]) )
                        .foregroundColor(.gray.opacity(0.5))
                    
       
                }
                .cornerRadius(16)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
               
                
            }

            .background(Color.white)
            .ignoresSafeArea()
        
            .sheet(isPresented: $isModalPresented) {
                NavigationView {
                    CategoryAdd(isPresented: $isModalPresented)
                        .navigationBarItems(trailing: Button("Cancel") {
                            isModalPresented = false
                        })
                }
            }
        }

    

}

struct BudgetView_Previews: PreviewProvider {
    static var previews: some View {
        BudgetView()
    }
}


