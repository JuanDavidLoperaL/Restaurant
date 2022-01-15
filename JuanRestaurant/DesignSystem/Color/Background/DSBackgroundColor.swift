//
//  DSBackgroundColor.swift
//  DesignSystem
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import UIKit

public enum DSBackgroundColor {
    case clear
    case mainScreen
    case paleTurquoise
    
    func getColor() -> UIColor {
        switch self {
        case .clear:
            return UIColor.clear
        case .mainScreen:
            let mainBackgroundColorName: String = "MainBackground"
            return UIColor(named: mainBackgroundColorName, in: bundle, compatibleWith: nil) ?? UIColor.white
        case .paleTurquoise:
            let cadetBlueColorName: String = "CadetBlue"
            return UIColor(named: cadetBlueColorName, in: bundle, compatibleWith: nil) ?? UIColor.cyan
        }
    }
}
