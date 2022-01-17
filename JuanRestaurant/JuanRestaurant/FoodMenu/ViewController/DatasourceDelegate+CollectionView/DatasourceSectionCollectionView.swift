//
//  DatasourceSectionCollectionView.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 16/01/22.
//

import UIKit

final class DatasourceSectionCollectionView: NSObject, UICollectionViewDataSource {
    
    // MARK: - Private Properties
    private let viewModel: FoodMenuViewModel
    
    // MARK: - Internal Init
    init(viewModel: FoodMenuViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: Datasource Protocol
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numbersOfRowsInCollection
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        viewModel.currentRowInCollection = indexPath.item
        guard let cell: SectionFoodCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: SectionFoodCollectionViewCell.cellIdentifier, for: indexPath) as? SectionFoodCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.set(viewModel: viewModel, currentIndex: indexPath.item)
        return cell
    }
}
