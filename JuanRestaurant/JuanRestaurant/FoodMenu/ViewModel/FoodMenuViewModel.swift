//
//  FoodMenuViewModel.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 15/01/22.
//

import Foundation

protocol FoodMenuViewModelDelegate: AnyObject {
    func reloadTableView()
}

final class FoodMenuViewModel {
    
    // MARK: - Private Properties
    private let restaurant: RestaurantInformation
    
    // MARK: - Internal Properties
    var currentRowInCollection: Int = 0
    var rowInCollectionSelected: Int = 0 {
        didSet {
            delegate?.reloadTableView()
        }
    }
    var currentRowInTableView: Int = 0
    
    // MARK: - Delegate
    weak var delegate: FoodMenuViewModelDelegate?
    
    // MARK: - Internal Init
    init(restaurant: RestaurantInformation) {
        self.restaurant = restaurant
    }
    
    // MARK: - Computed Properties
    var restaurantName: String {
        return restaurant.name.uppercased()
    }
    
    var numbersOfRowsInCollection: Int {
        guard let menuList: RestaurantMenus = restaurant.menus.first else {
            return 0
        }
        return menuList.sections.count
    }
    
    var sectionName: String {
        guard let menuList: RestaurantMenus = restaurant.menus.first else {
            return String()
        }
        return menuList.sections[currentRowInCollection].name
    }
    
    var numbersOfRowInTableViewBySection: Int {
        guard let menuList: RestaurantMenus = restaurant.menus.first else {
            return 0
        }
        return menuList.sections[rowInCollectionSelected].items.count
    }
    
    var plateInformation: (name: String, description: String, price: String) {
        guard let menuList: RestaurantMenus = restaurant.menus.first,
              menuList.sections[rowInCollectionSelected].items.indices.contains(currentRowInTableView) else {
            return (name: String(), description: String(), price: String())
        }
        let name: String = menuList.sections[rowInCollectionSelected].items[currentRowInTableView].name
        let description: String = menuList.sections[rowInCollectionSelected].items[currentRowInTableView].description
        let price: String = menuList.sections[rowInCollectionSelected].items[currentRowInTableView].pricing.first?.priceFormatted ?? String()
        return (name: name, description: description, price: price)
    }
}

// MARK: - Internal Function
extension FoodMenuViewModel {
    func shouldSelectedDividerBeActive(currentIndex: Int) -> Bool {
        return rowInCollectionSelected == currentIndex
    }
}
