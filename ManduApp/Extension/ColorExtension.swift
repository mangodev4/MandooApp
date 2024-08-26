//
//  ColorExtension.swift
//  ManduApp
//
//  Created by Yujin Son on 8/26/24.
//

import SwiftUI


// make color extension

extension Color {
    //MARK: App System color
    static let blue1 = Color(hex: "00B2FF")
    static let blue2 = Color(hex: "F7FDFF")
    static let blue3 = Color(hex: "68D2FF")
    static let blue4 = Color(hex: "EAF9FF")
    static let blue5 = Color(hex: "2C90FA")
    
    //MARK: Gray Scale
    static let gray1 = Color(hex: "6D6D6D")
    static let gray2 = Color(hex: "7F7F7F")
    static let gray3 = Color(hex: "D0D0D0")
    static let gray4 = Color(hex: "F4F4F4")
    

 
    static let peach = Color(hex: "ff8882")
    static let ivory = Color(hex: "f8ede3")
    static let brown = Color(hex: "897853")
}

//  UIColor Hex code extension

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}

