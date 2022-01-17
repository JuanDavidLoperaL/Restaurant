//
//  ButtonStyle.swift
//  DesignSystem
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import UIKit
import Foundation

public enum ButtonStyle {
    
    struct Configuration {
        var font: UIFont
        var backgroundColor: DSBackgroundColor
        var textColor: DSTextColor
        var align: NSTextAlignment
    }
    
    case primary
    
    func getConfiguration() -> Configuration {
        switch self {
        case .primary:
            let configuration: Configuration = Configuration(font: UIFont.systemFont(ofSize: 15.0, weight: .medium),
                                                             backgroundColor: DSBackgroundColor.cadetBlue,
                                                             textColor: DSTextColor.white,
                                                             align: NSTextAlignment.center)
            return configuration
        }
    }
}
