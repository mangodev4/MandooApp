//
//  DateSelectionSheet.swift
//  ManduApp
//
//  Created by Yujin Son on 9/2/24.
//

import SwiftUI

// MARK: - 만두일지 시트 뷰
struct DateSelectionSheet: View {
    @Binding var selectedDate: Date?
    @State private var storeName: String = ""
    @State private var pickedDate: Date?
    @State private var isOn = false
    var onDismiss: () -> Void

    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button(action:
                        onDismiss,
                       label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
                        .frame(width: 30, height: 30)
                })
            }
            
            Text("만두 일지")
                .font(.pretendBold24)
                .padding()
            
            HStack {
                Text("상호명")
                    .font(.pretendMedium16)
                Spacer()
                TextField("가게 이름", text: $storeName)
                    .textFieldStyle(CommonTextfieldStyle())
                    .frame(width: 200)
            }
            .padding(10)
            
            Divider()
            
            DatePicker(
                "날짜",
                selection: Binding(
                                    get: { selectedDate ?? Date() },
                                    set: { pickedDate = $0 }
                                ),
                displayedComponents: .date)
                .font(.pretendMedium16)
                .padding(10)
                .datePickerStyle(.automatic)
            Divider()
            
            HStack(spacing: 0) {
                Text("추천 메뉴")
                    .font(.pretendMedium16)
                    .padding(.leading, 10)
                
                Spacer()

                ToggleButtonView()
            }
            Divider()

            Spacer()
            
            Button("저장하기") {
                if let pickedDate = pickedDate {
                    selectedDate = pickedDate
                }
//                onSave()
                onDismiss()
                
            }
            .buttonStyle(OnboardingButtonStyle())
            .padding()
        }
        .padding()
    }
}
