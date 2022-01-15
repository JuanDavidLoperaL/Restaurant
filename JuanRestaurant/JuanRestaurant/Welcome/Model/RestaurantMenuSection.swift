//
//  RestaurantMenuSection.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import Foundation

struct RestaurantMenuSection: Decodable {
    let name: String
    let description: String
    let items: [RestaurantSectionItems]
    
    enum CodingKeys: String, CodingKey {
        case name = "section_name"
        case description
        case items = "menu_items"
    }
}
