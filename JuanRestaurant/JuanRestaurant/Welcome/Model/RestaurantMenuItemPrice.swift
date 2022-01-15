//
//  RestaurantMenuItemPrice.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import Foundation

struct RestaurantMenuItemPrice: Decodable {
    let price: Double
    let currency: String
    let priceFormatted: String
    
    enum CodingKeys: String, CodingKey {
        case price
        case currency
        case priceFormatted = "priceString"
    }
}
