//
//  DelegateMenuTableView.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 15/01/22.
//

import UIKit

final class DelegateMenuTableView: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
