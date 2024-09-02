//
//  MDCalenderView.swift
//  ManduApp
//
//  Created by Yujin Son on 8/23/24.
//

import SwiftUI

struct MDCalenderView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
            CalenderView(month: Date())
                .padding(30)
        }
    }
}

#Preview {
    MDCalenderView()
}
