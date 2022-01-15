//
//  RestaurantSectionItems.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import Foundation

struct RestaurantSectionItems: Decodable {
    let name: String
    let description: String
    let pricing: [RestaurantMenuItemPrice]
}
