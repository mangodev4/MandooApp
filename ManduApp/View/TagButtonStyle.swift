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
                .frame(height: 35)
                .cornerRadius(12)
                .foregroundColor(Color.blue)
            
            configuration.label
                .font(.pretendMedium16)
                .foregroundColor(Color.white)
        }
    }
}
