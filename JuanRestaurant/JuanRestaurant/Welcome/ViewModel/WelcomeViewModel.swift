//
//  WelcomeViewModel.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import APIManager
import UIKit

final class WelcomeViewModel {
    
    // MARK: - Private Properties
    private let api: WelcomeAPIProtocol
    private let downloadHundredPercent: CGFloat = 1.0
    private let downloadSixtyPercent: CGFloat = 0.6
    private let increaseDownloadInOnePercent: CGFloat = 0.01
    private var timer : Timer?
    private var trackValue: CGFloat = 0.0
    private(set) var restaurantInformation: RestaurantResult?
    private(set) var httpError: HttpError?
    
    // MARK: - Delegate
    weak var delegate: WelcomeViewControllerDelegate?
    
    // MARK: - Internal Init
    init(api: WelcomeAPIProtocol = WelcomeAPI()) {
        self.api = api
    }
    
    // MARK: - Computed Properties
    var restaurantName: String {
        return restaurantInformation?.result.name ?? String()
    }
    
    var hoursRestaurantOpen: String {
        return "Is open: \(restaurantInformation?.result.hours ?? String())"
    }
    
    var restaurantPhone: String {
        return "Telephone: \(restaurantInformation?.result.phone ?? String())"
    }
    
    var restaurantAddress: String {
        return "\nAddres:\n\(restaurantInformation?.result.address.city ?? String())\n\(restaurantInformation?.result.address.addressFormatted ?? String())"
    }
}

// MARK: - Internal Functions
extension WelcomeViewModel {
    func getRestaurantInfo(callback: @escaping(Bool) -> Void) {
        api.getRestaurantInformation { [weak self] result in
            DispatchQueue.main.async {
                self?.timer?.invalidate()
                switch result {
                case .success(let restaurant):
                    self?.restaurantInformation = restaurant
                    self?.delegate?.informationLoadedWithSucess()
                    self?.httpError = nil
                    callback(true)
                case .failure(let httpError):
                    self?.restaurantInformation = nil
                    self?.delegate?.errorLoadingInformation()
                    self?.httpError = httpError
                    callback(false)
                }
            }
        }
    }
    
    func startPercentLoader() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { _ in
            if self.trackValue >= self.downloadHundredPercent || self.trackValue >= self.downloadSixtyPercent {
                self.delegate?.setValueInLoader(track: self.trackValue)
                self.timer?.invalidate()
            } else {
                self.trackValue += self.increaseDownloadInOnePercent
                self.delegate?.setValueInLoader(track: self.trackValue)
            }
        })
    }
}
