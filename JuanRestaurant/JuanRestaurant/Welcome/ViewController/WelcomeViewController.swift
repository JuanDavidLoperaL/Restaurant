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
    
    typealias screenText = AppText.Welcome
    
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
        baseView.delegate = self
        viewModel.delegate = self
        getRestaurantInformation()
    }
}

// MARK: - Private Functions
extension WelcomeViewController {
    func getRestaurantInformation() {
        viewModel.startPercentLoader()
        viewModel.getRestaurantInfo { [weak self] result in
            if result {
                self?.baseView.set(viewModel: self?.viewModel ?? WelcomeViewModel())
            } else {
                self?.showAlertError()
            }
        }
    }
    
    func showAlertError() {
        let alert: UIAlertController = UIAlertController(title: screenText.alertErrorTitle,
                                                         message: "Main Problmen: \(viewModel.httpError ?? .genericError)\n\n\(screenText.alertErrorMessage)",
                                                         preferredStyle: .alert)
        let tryAgainAction: UIAlertAction = UIAlertAction(title: screenText.alertTryAgainAction, style: .default) { _ in
            self.getRestaurantInformation()
        }
        let cancelAction: UIAlertAction = UIAlertAction(title: screenText.alertCancelButton, style: .destructive, handler: nil)
        [tryAgainAction, cancelAction].forEach { action in
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: nil)
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

// MARK: - BaseView Delegate
extension WelcomeViewController: WelcomeBaseViewDelegate {
    func menuButtonTapped() {
        guard let restaurant: RestaurantInformation = viewModel.restaurantInformation?.result else {
            showAlertError()
            return
        }
        coordinator.navigateToFoodMenu(restaurant: restaurant)
    }
}
