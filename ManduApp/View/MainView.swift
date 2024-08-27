//
//  MainView.swift
//  ManduApp
//
//  Created by Yujin Son on 8/26/24.
//

import SwiftUI

struct MainView: View {
        let numberOfCircles = 6
        let radius: CGFloat = 150
        let smallCircleRadius: CGFloat = 50
        let innerOffset: CGFloat = 40
        
    var body: some View {
        
        VStack {

            VStack {
                HStack {
                    Text("안녕하세요, 만찐두빵 님")
                        .font(.title2)
                    Spacer()
                }
                .padding(.leading, 30)

                    HStack {
                        Text("오늘 만두 어떠세요?")
                            .font(.title2)

                        
                        Spacer()
                    }
                
                .padding(.leading, 30)
            }
            .padding(.top, 50)
//
//            Text("고냥만두")
//                .font(.system(size: 35))
            
            Spacer()
            
            ZStack {
                Circle()
                    .foregroundColor(Color.gray3)
                    .frame(width: radius * 2, height: radius * 2)
                
                ForEach(0..<numberOfCircles, id: \.self) { index in
                    Button(action: {
                        // 여기에 각 버튼의 액션을 추가하세요
                        print("Button \(index) tapped")
                    }) {
                        Circle()
                            .fill(Color.clear)
                            .frame(width: smallCircleRadius * 2, height: smallCircleRadius * 2)
                            .overlay(
                                Image("mandoo")
                                    .resizable()
                                    .scaledToFit()
                            )
                            .offset(x: (radius - innerOffset) * cos(angle(for: index)),
                                    y: (radius - innerOffset) * sin(angle(for: index)))
                    }
                    
                    
                }
            }
            
            Text("만두 6판 째")
                .font(.title)

            
            Spacer()
        }
    }
    func angle(for index: Int) -> Double {
        return 2 * .pi / Double(numberOfCircles) * Double(index)
    }
}

    

#Preview {
    MainView()
}
