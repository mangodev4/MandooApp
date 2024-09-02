//
//  TextfieldStyle.swift
//  ManduApp
//
//  Created by Yujin Son on 9/2/24.
//

import SwiftUI

struct CommonTextfieldStyle: TextFieldStyle {
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        
        ZStack {
            Rectangle()
                .foregroundColor(Color.gray4)
                .cornerRadius(8)
                .frame(height: 40)
            
            // Textfield
            configuration
                .font(.pretendMedium16)
                .padding()
        }
    }
}
