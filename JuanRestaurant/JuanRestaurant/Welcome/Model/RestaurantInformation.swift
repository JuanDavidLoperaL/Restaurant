//
//  RestaurantInformation.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import Foundation

struct RestaurantInformation: Decodable {
    let id: Int
    let name: String
    let phone: String
    let hours: String
    let address: RestaurantAddress
    let menus: [RestaurantMenus]
    
    enum CodingKeys: String, CodingKey {
        case id = "restaurant_id"
        case name = "restaurant_name"
        case phone = "restaurant_phone"
        case hours
        case address
        case menus
    }
}
