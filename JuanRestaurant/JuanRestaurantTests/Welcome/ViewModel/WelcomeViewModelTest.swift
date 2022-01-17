//
//  WelcomeViewModelTest.swift
//  JuanRestaurantTests
//
//  Created by Juan David Lopera Lopez on 17/01/22.
//

import XCTest
@testable import JuanRestaurant

class WelcomeViewModelTest: XCTestCase {
    
    var viewModel: WelcomeViewModel!
    var api: WelcomeAPIMock!

    override func setUpWithError() throws {
        api = WelcomeAPIMock()
        viewModel = WelcomeViewModel(api: api)
    }

    func testGetRestaurantInfoWithSuccess() {
        api.withError = false
        viewModel.getRestaurantInfo { result in
            XCTAssertTrue(result)
        }
    }
    
    func testGetRestaurantInfoWithError() {
        api.withError = true
        viewModel.getRestaurantInfo { result in
            XCTAssertFalse(result)
        }
    }
    
    func testRestaurantName() {
        api.withError = false
        viewModel.getRestaurantInfo { result in
            XCTAssertFalse(self.viewModel.restaurantName.isEmpty)
            XCTAssertEqual(self.viewModel.restaurantName, "Juan Restaurant")
        }
    }
    
    func testHoursRestaurantOpen() {
        api.withError = false
        viewModel.getRestaurantInfo { result in
            XCTAssertFalse(self.viewModel.hoursRestaurantOpen.isEmpty)
            XCTAssertEqual(self.viewModel.restaurantName, "Is open: Daily from 2pm to 10pm")
        }
    }
    
    func testRestaurantPhone() {
        api.withError = false
        viewModel.getRestaurantInfo { result in
            XCTAssertFalse(self.viewModel.restaurantPhone.isEmpty)
            XCTAssertEqual(self.viewModel.restaurantPhone, "Telephone: 11 979678120")
        }
    }
}
