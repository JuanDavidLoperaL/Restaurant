//
//  EnvironmentURLHandler.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import Foundation

enum EnvironmentURLs: String {
    case baseURL = "BaseURL"
}

final class EnvironmentURLHandler {
    
    static func variable(key: EnvironmentURLs) -> URLComponents {
        let bundle: Bundle = Bundle(for: EnvironmentURLHandler.self)
        guard
            let urlString: String = bundle.infoDictionary?[key.rawValue] as? String,
            let url: URLComponents = URLComponents(string: urlString)
        else {
            fatalError("not possible to build URLComponent object in EnvironmentURLHandler class")
        }
        return url
    }
}
