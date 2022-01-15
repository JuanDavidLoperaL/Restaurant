//
//  RestaurantMenus.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import Foundation

struct RestaurantMenus: Decodable {
    let name: String
    let sections: [RestaurantMenuSection]
    
    enum CodingKeys: String, CodingKey {
        case name = "menu_name"
        case sections = "menu_sections"
    }
}
