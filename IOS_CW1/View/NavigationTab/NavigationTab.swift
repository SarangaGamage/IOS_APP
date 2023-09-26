//
//  NavigationTab.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct NavigationTab: View {
    @State var isAddExpenseSheetPresented = false
    @State var selectTab: Int = 0
    @EnvironmentObject var userSessionManager: UserSessionManager
    var body: some View {
        ZStack{
            
            if(selectTab == 0) {
         
                DashboardView()
            }
            
            if(selectTab == 1) {

                BudgetView()
            }
            
            if(selectTab == 2) {
        
               FinancialSummaryView()
            }
            
            if(selectTab == 3) {
                BudgetView()
            }
            VStack{
                Spacer()
                
                ZStack(alignment: .bottom){
                    
                    
                    
                    ZStack(alignment: .center) {
                        Image("NavBar")
                            .resizable()
                            .scaledToFit()
                        
                        HStack(alignment: .center, spacing: 0){
                            
                            Spacer()
                            Button {
                                selectTab = 0
                            } label: {
                                Image(systemName: "house.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                            }
                            .foregroundColor(selectTab == 0 ? .white : .gray)
                            
                            Spacer()
                            Button {
                                selectTab = 1
                            } label: {
                                Image(systemName: "list.bullet")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                            }
                            .foregroundColor(selectTab == 1 ? .white : .gray)
                            
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: 80, height: 0)
                            
                            Button {
                                selectTab = 2
                            } label: {
                                Image(systemName: "doc.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                            }
                            .foregroundColor(selectTab == 2 ? .white : .gray)
                            
                            Spacer()
                            Button {
                                selectTab = 3
                            } label: {
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .padding()
                            }
                            .foregroundColor(selectTab == 3 ? .white : .gray)

                            Spacer()
                        }
                    }
                    
                    Button {
                          isAddExpenseSheetPresented.toggle()
                      } label: {
                          Image("AddButton")
                              .resizable()
                              .frame(width: 50, height: 50)
                              .padding()
                      }
                      .padding(.bottom, 6)
                  //  .shadow(color: .secondaryC.opacity(0.5), radius: 6,y: 4)
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom , 10)
            .sheet(isPresented: $isAddExpenseSheetPresented) {
                       ExpensesAdd(isPresented: $isAddExpenseSheetPresented)
                   }
        }
       // .background(Color.gray)
        .ignoresSafeArea()
        
    }
}

struct NavigationTab_Previews: PreviewProvider {
    static var previews: some View {
        NavigationTab()
            .environmentObject(UserSessionManager()) 
    }
}
