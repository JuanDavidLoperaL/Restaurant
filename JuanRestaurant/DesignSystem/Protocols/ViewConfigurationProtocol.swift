//
//  ViewConfigurationProtocol.swift
//  DesignSystem
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import Foundation

public protocol ViewConfigurationProtocol {
    func setup()
    func setupViewHierarchy()
    func setupConstraints()
    func configureViews()
}

public extension ViewConfigurationProtocol {
    func setup() {
        setupViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews() {}
}
