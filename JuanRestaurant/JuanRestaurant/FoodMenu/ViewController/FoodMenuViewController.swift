//
//  FoodMenuViewController.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import Foundation
import UIKit

final class FoodMenuViewController: UIViewController {
    
    // MARK: - Private UI Properties
    private let baseView: FoodMenuBaseView = FoodMenuBaseView()
    
    // MARK: - Private Properties
    private let coordinator: AppCoordinator
    private let viewModel: FoodMenuViewModel
    
    // MARK: - Internal Init
    init(coordinator: AppCoordinator,
         viewModel: FoodMenuViewModel) {
        self.coordinator = coordinator
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func loadView() {
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        baseView.delegate = self
        baseView.set(viewModel: viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

// MARK: - ViewModel Delegate Implementation
extension FoodMenuViewController: FoodMenuViewModelDelegate {
    func reloadTableView() {
        baseView.reloadCollection()
        baseView.reloadTableView()
    }
}

// MARK: - BaseView Delegate Implementation
extension FoodMenuViewController: FoodMenuBaseViewDelegate {
    func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
