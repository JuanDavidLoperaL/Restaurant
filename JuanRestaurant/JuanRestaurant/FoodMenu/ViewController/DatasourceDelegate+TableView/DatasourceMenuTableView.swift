//
//  DatasourceMenuTableView.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 15/01/22.
//

import UIKit

final class DatasourceMenuTableView: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    private let viewModel: FoodMenuViewModel
    
    // MARK: - Internal Init
    init(viewModel: FoodMenuViewModel) {
        self.viewModel = viewModel
    }
    
    // MARK: Datasource Protocol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numbersOfRowInTableViewBySection
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        viewModel.currentRowInTableView = indexPath.row
        guard let cell: MenuItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: MenuItemTableViewCell.cellIdentifier, for: indexPath) as? MenuItemTableViewCell else {
            return UITableViewCell()
        }
        cell.set(viewModel: viewModel)
        return cell
    }
    
}
