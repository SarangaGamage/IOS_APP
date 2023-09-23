//
//  SegmentButton.swift
//  IOS_CW1
//
//  Created by Saranga Gamage on 2023-09-23.
//

import SwiftUI

struct SegmentButton: View {
    @State var title: String = "Title"
    var isActive: Bool = false
    var onPressed: ( ()->())?
    
    var body: some View {
        Button {
            onPressed?()
        } label: {
            Text(title)
                .font(.system(size: 12, weight: .semibold))
        }
        .foregroundColor( isActive ? .white : .gray )
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 42, maxHeight: 42)
        
        .background(Color.gray.opacity( isActive ? 0.2 : 0.0 ))
        .overlay {
            RoundedRectangle(cornerRadius:  12)
                .stroke( isActive ? Color.gray : .clear, lineWidth: 1)
        }
        .cornerRadius(12)
    }
}

struct SegmentButton_Previews: PreviewProvider {
    static var previews: some View {
        SegmentButton()
    }
}
