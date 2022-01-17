//
//  AppCoordinator.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import Foundation
import UIKit

final class AppCoordinator {
    
    // MARK: - Private Properties
    private let navigationController: UINavigationController
    
    // MARK: - Internal Init
    init(navigationController: UINavigationController = UINavigationController()) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal Functions
    func start() -> UINavigationController {
        let viewController: WelcomeViewController = WelcomeViewController(coordinator: self)
        navigationController.setViewControllers([viewController], animated: true)
        return navigationController
    }
    
    func navigateToFoodMenu(restaurant: RestaurantInformation) {
        let viewModel: FoodMenuViewModel = FoodMenuViewModel(restaurant: restaurant)
        let viewController: FoodMenuViewController = FoodMenuViewController(coordinator: self, viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
