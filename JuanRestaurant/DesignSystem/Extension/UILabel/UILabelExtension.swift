//
//  UILabelExtension.swift
//  DesignSystem
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import Foundation
import UIKit

public extension UILabel {
    func apply(style: LabelStyle) {
        let configuration: LabelStyle.Configuration = style.getConfiguration()
        self.textAlignment = configuration.align
        self.font = configuration.font
        self.textColor = configuration.textColor.getColor()
    }
}
