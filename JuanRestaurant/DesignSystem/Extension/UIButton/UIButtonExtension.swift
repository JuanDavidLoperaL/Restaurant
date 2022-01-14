//
//  UIButtonExtension.swift
//  DesignSystem
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import UIKit

public extension UIButton {
    func apply(style: ButtonStyle) {
        let configuration: ButtonStyle.Configuration = style.getConfiguration()
        let cornerRadius: CGFloat = 10.0
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = configuration.backgroundColor.getColor()
        self.titleLabel?.font = configuration.font
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.setTitleColor(configuration.textColor.getColor(), for: .normal)
        self.titleLabel?.textAlignment = configuration.align
    }
}
