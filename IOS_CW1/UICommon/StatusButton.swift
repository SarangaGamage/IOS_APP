//
//  StatusButton.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct StatusButton: View {
    @State var title: String = "Title"
    @State var value: String = "0"
    @State var color: Color = .secondary
    var onPressed: (()->())?
    var body: some View {
        
        Button {
            onPressed?()
        } label: {
            ZStack(alignment: .top){
                VStack{
                    VStack {
                        Image(systemName: "plus.circle")
                            .font(.system(size: 24))
                            .foregroundColor(.blue)
                        
                        Text(title)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.blue)
                        
//                        Text(String(value))
//                            .font(.system(size: 14, weight: .semibold))
//                            .foregroundColor(.black)
                    }

                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 68, maxHeight: 68)
                
                .background(color.opacity(0.5))
                .overlay {
                    RoundedRectangle(cornerRadius:  16)
                        .stroke( Color.gray.opacity(0.5), lineWidth: 1)
                }
                .cornerRadius(16)
                
                Rectangle()
                    .fill(color)
                    .frame(width: 60, height: 1, alignment: .center)
            }
        }

        
    }
}

struct StatusButton_Previews: PreviewProvider {
    static var previews: some View {
        StatusButton()
    }
}
