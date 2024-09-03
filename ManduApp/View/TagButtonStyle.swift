//
//  TagButtonStyle.swift
//  ManduApp
//
//  Created by Yujin Son on 9/2/24.
//

import SwiftUI

struct OnboardingButtonStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Rectangle()
                .frame(height: 25)
                .cornerRadius(4)
                .foregroundColor(Color.blue1)
            
            configuration.label
                .font(.pretendMedium16)
                .foregroundColor(Color.white)
        }
    }
}
