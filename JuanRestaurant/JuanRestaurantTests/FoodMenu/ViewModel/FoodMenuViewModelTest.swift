//
//  FoodMenuViewModelTest.swift
//  JuanRestaurantTests
//
//  Created by Juan David Lopera Lopez on 17/01/22.
//

import XCTest
@testable import JuanRestaurant

class FoodMenuViewModelTest: XCTestCase {
    
    var viewModel: FoodMenuViewModel!

    override func setUpWithError() throws {
        viewModel = FoodMenuViewModel(restaurant: RestaurantResult.getMock().result)
    }
    
    func testRestaurantName() {
        XCTAssertEqual(viewModel.restaurantName, "Juan Restaurant".uppercased())
    }
    
    func testNumbersOfRowsInCollection() {
        XCTAssertEqual(viewModel.numbersOfRowsInCollection, 1)
    }
    
    func testSectionName() {
        XCTAssertEqual(viewModel.sectionName, "Breakfast")
    }
    
    func testNumbersOfRowInTableViewBySection() {
        XCTAssertEqual(viewModel.numbersOfRowInTableViewBySection, 1)
    }
    
    func testPlateInformation() {
        XCTAssertEqual(viewModel.plateInformation.name, "Eggs")
        XCTAssertEqual(viewModel.plateInformation.description, "Eggs / salt / bacon")
        XCTAssertEqual(viewModel.plateInformation.price, "$ 10.0")
    }
}
