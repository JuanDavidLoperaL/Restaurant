//
//  WelcomeViewController.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import UIKit

protocol WelcomeViewControllerDelegate: AnyObject {
    func setValueInLoader(track: CGFloat)
    func informationLoadedWithSucess()
    func errorLoadingInformation()
}

final class WelcomeViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let baseView: WelcomeBaseView = WelcomeBaseView()
    
    // MARK: - Private Properties
    private let coordinator: AppCoordinator
    private let viewModel: WelcomeViewModel
    
    // MARK: - Internal Init
    init(coordinator: AppCoordinator, viewModel: WelcomeViewModel = WelcomeViewModel()) {
        self.coordinator = coordinator
        self.viewModel = viewModel
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
        viewModel.delegate = self
        viewModel.startPercentLoader()
        viewModel.getRestaurantInfo { [weak self] result in
            if result {
                self?.baseView.set(viewModel: self?.viewModel ?? WelcomeViewModel())
            } else {
                print("Error here")
            }
        }
    }
}

// MARK: - WelcomeViewController Protocol Implementation
extension WelcomeViewController: WelcomeViewControllerDelegate {
    func setValueInLoader(track: CGFloat) {
        baseView.showLoader(with: track)
    }
    
    func informationLoadedWithSucess() {
        baseView.loaderFinished(withError: false)
    }
    
    func errorLoadingInformation() {
        baseView.loaderFinished(withError: true)
    }
}
