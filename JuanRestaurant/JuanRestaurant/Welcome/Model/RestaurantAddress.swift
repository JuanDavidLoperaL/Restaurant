//
//  RestaurantAddress.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import Foundation

struct RestaurantAddress: Decodable {
    let city: String
    let addressFormatted: String
    
    enum CodingKeys: String, CodingKey {
        case city
        case addressFormatted = "formatted"
    }
}
