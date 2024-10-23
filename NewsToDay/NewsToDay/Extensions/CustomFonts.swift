//
//  CustomFonts.swift
//  NewsToDay
//
//  Created by Roman Golub on 23.10.2024.
//

import SwiftUI

enum InterFont: String {
    case regular = "Inter-Regular"
    case medium = "Inter-Medium"
    case semiBold = "Inter-SemiBold"
    case bold = "Inter-Bold"
}

extension Font {
    static func interFont(_ font: InterFont, size: CGFloat) -> Font {
        return .custom(font.rawValue, size: size)
    }
}
