//
//  CalendarViewModel.swift
//  ManduApp
//
//  Created by Yujin Son on 9/3/24.
//

import SwiftUI
import Combine

class CalendarViewModel: ObservableObject {
    @Published var month: Date
    @Published var clickedDates: Set<Date> = []
    
    init(month: Date) {
        self.month = month
    }
    
    /// 월 변경
    func changeMonth(by value: Int) {
      let calendar = Calendar.current
      if let newMonth = calendar.date(byAdding: .month, value: value, to: month) {
        self.month = newMonth
      }
    }

    /// 해당 월의 시작 날짜
    func startOfMonth() -> Date {
      let components = Calendar.current.dateComponents([.year, .month], from: month)
      return Calendar.current.date(from: components)!
    }

    /// 특정 해당 날짜
    func getDate(for day: Int) -> Date {
      return Calendar.current.date(byAdding: .day, value: day, to: startOfMonth())!
    }

    /// 해당 월에 존재하는 일자 수
    func numberOfDays(in date: Date) -> Int {
      return Calendar.current.range(of: .day, in: .month, for: date)?.count ?? 0
    }
    
    /// 해당 월의 첫 날짜가 갖는 해당 주의 몇번째 요일
    func firstWeekdayOfMonth(in date: Date) -> Int {
      let components = Calendar.current.dateComponents([.year, .month], from: date)
      let firstDayOfMonth = Calendar.current.date(from: components)!
      
      return Calendar.current.component(.weekday, from: firstDayOfMonth)
    }
}
