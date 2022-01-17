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
    case cadetBlue
    case divider
    case selectedDivider
    
    func getColor() -> UIColor {
        switch self {
        case .clear:
            return UIColor.clear
        case .mainScreen:
            let mainBackgroundColorName: String = "MainBackground"
            return UIColor(named: mainBackgroundColorName, in: bundle, compatibleWith: nil) ?? UIColor.white
        case .cadetBlue:
            let cadetBlueColorName: String = "CadetBlue"
            return UIColor(named: cadetBlueColorName, in: bundle, compatibleWith: nil) ?? UIColor.cyan
        case .divider:
            let dividerColorName: String = "Divider"
            return UIColor(named: dividerColorName, in: bundle, compatibleWith: nil) ?? UIColor.lightGray
        case .selectedDivider:
            let selectedDividerColorName: String = "SelectedDivider"
            return UIColor(named: selectedDividerColorName, in: bundle, compatibleWith: nil) ?? UIColor.black
        }
    }
}
