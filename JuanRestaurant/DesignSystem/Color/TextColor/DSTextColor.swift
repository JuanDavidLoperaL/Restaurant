//
//  DSTextColor.swift
//  DesignSystem
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import Foundation
import UIKit

public enum DSTextColor {
    case black
    case white
    
    func getColor() -> UIColor {
        switch self {
        case .black:
            return UIColor.black
        case .white:
            return UIColor.white
        }
    }
}
