//
//  WelcomeAPIMock.swift
//  JuanRestaurantTests
//
//  Created by Juan David Lopera Lopez on 17/01/22.
//

import APIManager
import Foundation
@testable import JuanRestaurant

final class WelcomeAPIMock: WelcomeAPIProtocol {
    
    var withError: Bool = false
    
    func getRestaurantInformation(callback: @escaping (Result<RestaurantResult?, HttpError>) -> Void) {
        if withError {
            callback(.failure(.genericError))
        } else {
            callback(.success(RestaurantResult.getMock()))
        }
    }
}
