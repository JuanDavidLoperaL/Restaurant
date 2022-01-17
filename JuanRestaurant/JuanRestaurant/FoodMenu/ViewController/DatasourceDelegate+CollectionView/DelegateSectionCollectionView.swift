//
//  DelegateSectionCollectionView.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 16/01/22.
//

import UIKit

final class DelegateSectionCollectionView: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // MARK: - Internal Properties
    private let viewModel: FoodMenuViewModel
    
    // MARK: - Internal Init
    init(viewModel: FoodMenuViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: - Delegate Protocol Implementation
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.rowInCollectionSelected = indexPath.item
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160.0, height: 50.0)
    }
}
