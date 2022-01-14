//
//  DSBackgroundColor.swift
//  DesignSystem
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import UIKit

public enum DSBackgroundColor {
    case mainScreen
    case paleTurquoise
    
    func getColor() -> UIColor {
        switch self {
        case .mainScreen:
            let mainBackgroundColorName: String = "MainBackground"
            return UIColor(named: mainBackgroundColorName, in: bundle, compatibleWith: nil) ?? UIColor.white
        case .paleTurquoise:
            let paleTurquoiseColorName: String = "PaleTurquoise"
            return UIColor(named: paleTurquoiseColorName, in: bundle, compatibleWith: nil) ?? UIColor.cyan
        }
    }
}
