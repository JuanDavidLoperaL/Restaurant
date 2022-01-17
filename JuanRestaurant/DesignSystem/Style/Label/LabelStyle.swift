//
//  LabelStyle.swift
//  DesignSystem
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import UIKit

public enum LabelStyle {
    struct Configuration {
        var font: UIFont
        var textColor: DSTextColor
        var align: NSTextAlignment
    }

    case h1Medium(align: NSTextAlignment, color: DSTextColor = .black)
    case h1Regular(align: NSTextAlignment, color: DSTextColor = .black)
    case h2Regular(align: NSTextAlignment, color: DSTextColor = .black)
    case h2Medium(align: NSTextAlignment, color: DSTextColor = .black)
    case h3Medium(align: NSTextAlignment, color: DSTextColor = .black)
    case h3Regular(align: NSTextAlignment, color: DSTextColor = .black)
    case h4Regular(align: NSTextAlignment, color: DSTextColor = .black)
    
    func getConfiguration() -> Configuration {
        switch self {
        case let .h1Medium(align, color):
            let font: UIFont = UIFont.systemFont(ofSize: 24.0, weight: UIFont.Weight.medium)
            let configuration: Configuration = Configuration(font: font,
                                                             textColor: color,
                                                             align: align)
            return configuration
        case let .h1Regular(align, color):
            let font: UIFont = UIFont.systemFont(ofSize: 24.0, weight: UIFont.Weight.regular)
            let configuration: Configuration = Configuration(font: font,
                                                             textColor: color,
                                                             align: align)
            return configuration
        case let .h2Regular(align, color):
            let font: UIFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.regular)
            let configuration: Configuration = Configuration(font: font,
                                                             textColor: color,
                                                             align: align)
            return configuration
        case let .h2Medium(align, color):
            let font: UIFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
            let configuration: Configuration = Configuration(font: font,
                                                             textColor: color,
                                                             align: align)
            return configuration
        case let .h3Medium(align, color):
            let font: UIFont = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
            let configuration: Configuration = Configuration(font: font,
                                                             textColor: color,
                                                             align: align)
            return configuration
        case let .h3Regular(align, color):
            let font: UIFont = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
            let configuration: Configuration = Configuration(font: font,
                                                             textColor: color,
                                                             align: align)
            return configuration
        case let .h4Regular(align, color):
            let font: UIFont = UIFont.systemFont(ofSize: 11, weight: UIFont.Weight.regular)
            let configuration: Configuration = Configuration(font: font,
                                                             textColor: color,
                                                             align: align)
            return configuration
        }
    }
}
