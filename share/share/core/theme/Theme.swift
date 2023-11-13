//
//  Theme.swift
//  share
//
//  Created by Firoz Khursheed on 2023-11-12.
//

import Foundation
import SwiftUI

/// Theme structure to manage the color and font styles used throughout the app.
struct Theme {
    static let primaryColor =  Color(red: CGFloat(190)/255.0, green: CGFloat(208)/255.0, blue: CGFloat(211)/255.0)
    static let secondaryColor = Color.gray
    static let backgroundColor = primaryColor.opacity(0.5)

    /// Nested struct for managing text colors used in the app.
    struct TextColor {
        static let primary = primaryColor
        static let title = Color.white
        static let body1 = Color(red: CGFloat(250)/255.0, green: CGFloat(249)/255.0, blue: CGFloat(246)/255.0)
        static let body2 = Color(red: CGFloat(210)/255.0, green: CGFloat(209)/255.0, blue: CGFloat(216)/255.0)
    }
    
    /// Nested struct for defining the font styles used in the app
    struct Fonts {
        static let largeTitle = Font.largeTitle
        static let headline = Font.headline
        static let subheadline = Font.subheadline
        static let body = Font.body
        static let caption = Font.caption
    }
}
