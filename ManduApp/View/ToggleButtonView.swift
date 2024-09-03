//
//  ToggleButtonView.swift
//  ManduApp
//
//  Created by Yujin Son on 9/3/24.
//

import SwiftUI

struct ToggleButtonView: View {
    @State private var selectedIndex: Int? = nil
    
    let buttons = ["찐만두", "군만두", "왕만두", "김치만두", "딤섬만두", "교자만두", "기타"]
    
    var body: some View {
        let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

        
        LazyVGrid(columns: columns, spacing: 5) {
            ForEach(0..<buttons.count, id: \.self) { index in
                Button (action: {
                    if selectedIndex == index {
                        selectedIndex = nil
                    } else {
                        selectedIndex = index
                    }
                }) {
                    Text(buttons[index])
                        .font(.pretendBold14)
                        .foregroundColor(selectedIndex == index ? Color.white: Color.black )
                        .padding(.horizontal, 12)
                        .padding(.vertical, 8)
//                        .frame(maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 14)
                                .stroke(Color.blue, lineWidth: 2)
                                .fill(selectedIndex == index ? Color.blue : Color.white)
                        )


                }

            }
        }
        .frame(width: 250)
        .padding()
    }
}

#Preview {
    ToggleButtonView()
}
