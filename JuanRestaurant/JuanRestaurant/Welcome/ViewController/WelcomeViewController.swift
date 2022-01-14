//
//  WelcomeViewController.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let baseView: WelcomeBaseView = WelcomeBaseView()
    
    // MARK: - Private Properties
    private let coordinator: AppCoordinator
    
    // MARK: - Internal Init
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Life cycle
    override func loadView() {
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
