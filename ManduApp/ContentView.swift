//
//  ContentView.swift
//  ManduApp
//
//  Created by Yujin Son on 8/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CalenderView(viewModel: CalendarViewModel(month: Date()))
    }
}

#Preview {
    ContentView()
}
