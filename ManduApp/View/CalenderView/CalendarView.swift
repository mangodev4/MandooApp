//
//  CalendarView.swift
//  ManduApp
//
//  Created by Yujin Son on 8/23/24.
//

import SwiftUI

struct CalenderView: View {
    @ObservedObject var viewModel: CalendarViewModel
//    @State var month: Date
    @State var offset: CGSize = CGSize()
    @State var clickedDates: Set<Date> = []
    
    @State private var showDateSelectionSheet = false
    @State private var selectedDate: Date?

    var body: some View {
        VStack {
            headerView
                .background(Color.clear)
                .zIndex(1)
            calendarGridView
        }
        .padding(.horizontal, 10)
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    self.offset = gesture.translation
                }
                .onEnded { gesture in
                    if gesture.translation.width < -100 {
                        viewModel.changeMonth(by: 1)
                    } else if gesture.translation.width > 100 {
                        viewModel.changeMonth(by: -1)
                    }
                    self.offset = CGSize()
                }
        )
        .sheet(isPresented: $showDateSelectionSheet) {
            DateSelectionSheet(selectedDate: $selectedDate, onDismiss: {
                showDateSelectionSheet = false
            })
        }
    }
    
    // MARK: - Sheet 뷰
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
                
//                Button("Close") {
//                    onDismiss()
//                }
//                .padding()
            }
            .padding()
        }
    }
    
    
    // MARK: - 헤더 뷰
    private var headerView: some View {
        VStack {
            HStack {
                Button(action: {
                    HapticManager.shared.mediumHaptic()
                    viewModel.changeMonth(by: -1)
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.blue3)
                        .font(.title3)
                        .padding(.trailing, 20)
                        .padding(.bottom, 10)
                }
                Text(viewModel.month, formatter: Self.dateFormatter)
                    .frame(width: 220)
                    .font(.pretendSemiBold28)
                    .padding(.bottom)
                Button(action: {
                    HapticManager.shared.mediumHaptic()
                    viewModel.changeMonth(by: 1)
                }) {
                    Image(systemName: "chevron.right")
                        .foregroundColor(.blue3)
                        .font(.title3)
                        .padding(.leading, 20)
                        .padding(.bottom, 10)
                }
            }
            .padding(.bottom, 10)
            
            HStack {
                ForEach(Self.weekdaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .foregroundColor(.gray2)
                        .font(.pretendMedium18)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding(.bottom, 5)
        }
    }
    
    // MARK: - 날짜 그리드 뷰
    private var calendarGridView: some View {
        let daysInMonth: Int = viewModel.numberOfDays(in: viewModel.month)
        let firstWeekday: Int = viewModel.firstWeekdayOfMonth(in: viewModel.month) - 1
        let today = Calendar.current.startOfDay(for: Date())
        
        
        return VStack {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 7),spacing: 3) {
                ForEach(0 ..< daysInMonth + firstWeekday, id: \.self) { index in
                    if index < firstWeekday {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundColor(Color.clear)
                    } else {
                        let date = viewModel.getDate(for: index - firstWeekday)
                        let day = index - firstWeekday + 1
                        let clicked = clickedDates.contains(date)
                        let isToday = Calendar.current.isDate(date, inSameDayAs: today)
                        
                        
                        ZStack {
                            if isToday {
                                Circle()
                                    .fill(Color.peach)
                                    .frame(width: 36, height: 36)
                            }
                            
                            CellView(day: day, clicked: clicked)
                                .frame(width: 45, height: 60)
//                                .background(
//                                    Rectangle()
//                                        .foregroundColor(Color.clear)
//                                    //                                    .scaleEffect(4)
//                                )
                                .onTapGesture {
                                    showDateSelectionSheet = true
                                    selectedDate = date
                                }
                        }
                    }
                }
            }
        }
    }
    
    
    // MARK: - 일자 셀 뷰
    private struct CellView: View {
        var day: Int
        var clicked: Bool = false
        var isSunday: Bool = false
        
        
        init(day: Int, clicked: Bool) {
            self.day = day
            self.clicked = clicked
        }
        
        var body: some View {
            VStack {
                Rectangle()
                    .frame(width: 25, height: 25)
                    .opacity(0)
                    .overlay(Text(String(day)))
                    .foregroundColor(.black)
                    .font(.pretendMedium20)
                
                      if clicked {
                        Text("Click")
                          .font(.caption)
                          .foregroundColor(.red)
                      }
            }
        }
    }
}
// MARK: - 내부 메서드
private extension CalenderView {
    
  
}

// MARK: - Static 프로퍼티
extension CalenderView {
  static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM yyyy"
    return formatter
  }()
  
  static let weekdaySymbols = Calendar.current.shortWeekdaySymbols
}
