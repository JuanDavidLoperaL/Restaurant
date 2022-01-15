//
//  WelcomeAPI.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import APIManager
import Foundation

protocol WelcomeAPIProtocol {
    func getRestaurantInformation(callback: @escaping(Result<RestaurantResult?, HttpError>) -> Void)
}

final class WelcomeAPI: WelcomeAPIProtocol {
    
    // MARK: - Enum Endpoints
    enum Endpoint: String {
        case restaurantInfo = "/v2/restaurant/"
    }
    
    // MARK: - Private Properties
    private var baseURL: URLComponents
    private var apimanager: APIManager = APIManager()
    
    // MARK: - Internal Init
    init(baseURL: URLComponents = EnvironmentURLHandler.variable(key: .baseURL)) {
        self.baseURL = baseURL
    }
    
    func getRestaurantInformation(callback: @escaping(Result<RestaurantResult?, HttpError>) -> Void) {
        let restaurantId: String = "4072702673999819"
        baseURL.path = "\(Endpoint.restaurantInfo.rawValue)\(restaurantId)"
        baseURL.queryItems = [URLQueryItem(name: "key", value: "f817603fcf66553f70f9dec2232c87de")]
        guard
            let url: URL = baseURL.url
        else {
            fatalError("Error getting URL from URLComponent Function: \(#function)  -- code line: \(#line)")
        }
        apimanager.request(to: url, method: .get, completion: callback)
    }
}
