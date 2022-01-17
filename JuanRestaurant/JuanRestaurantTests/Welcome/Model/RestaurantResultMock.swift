//
//  RestaurantResultMock.swift
//  JuanRestaurantTests
//
//  Created by Juan David Lopera Lopez on 17/01/22.
//

import Foundation
@testable import JuanRestaurant

extension RestaurantResult {
    static func getMock() -> RestaurantResult {
        let price: [RestaurantMenuItemPrice] = [
            RestaurantMenuItemPrice(price: 10.0, currency: "USD", priceFormatted: "$ 10.0")
        ]
        let items: [RestaurantSectionItems] = [
            RestaurantSectionItems(name: "Eggs", description: "Eggs / salt / bacon", pricing: price)
        ]
        let breakfastSection: [RestaurantMenuSection] = [RestaurantMenuSection(name: "Breakfast", description: "Just breakfast", items: items)]
        let menus: [RestaurantMenus] = [
            RestaurantMenus(name: "Breakfast", sections: breakfastSection)
        ]
        let address: RestaurantAddress = RestaurantAddress(city: "Medellin", addressFormatted: "Medellin, Colombia")
        let restaurantInformation: RestaurantInformation = RestaurantInformation(id: 0, name: "Juan Restaurant", phone: "11 979678120", hours: "Daily from 2pm to 10pm", address: address, menus: menus)
        return RestaurantResult(result: restaurantInformation)
    }
}
