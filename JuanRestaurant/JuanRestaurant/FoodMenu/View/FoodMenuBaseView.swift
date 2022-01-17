//
//  FoodMenuBaseView.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import DesignSystem
import UIKit

protocol FoodMenuBaseViewDelegate: AnyObject {
    func backButtonTapped()
}

final class FoodMenuBaseView: UIView {
    
    typealias screenText = AppText.FoodMenuText
    
    // MARK: - Private UI Properties
    private let restaurantNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h2Medium(align: .center))
        return label
    }()
    
    private let dividerRestaurantNameView: UIView = {
        let view: UIView = UIView()
        view.apply(background: .divider)
        return view
    }()
    
    private let menuTitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h2Medium(align: .center))
        return label
    }()
    
    private let dividerMenuView: UIView = {
        let view: UIView = UIView()
        view.apply(background: .divider)
        return view
    }()
    
    private let menuSectionCollectionView: UICollectionView = {
        let flowLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        let collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.register(SectionFoodCollectionViewCell.self, forCellWithReuseIdentifier: SectionFoodCollectionViewCell.cellIdentifier)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private let dividerRestaurantSectionView: UIView = {
        let view: UIView = UIView()
        view.apply(background: .divider)
        return view
    }()
    
    private let menuTableView: UITableView = {
        let tableView: UITableView = UITableView()
        tableView.register(MenuItemTableViewCell.self, forCellReuseIdentifier: MenuItemTableViewCell.cellIdentifier)
        tableView.tableFooterView = UIView()
        return tableView
    }()
    
    private let backButton: UIButton = {
        let button: UIButton = UIButton()
        button.addTarget(self, action: #selector(backButtonAction), for: .touchDown)
        return button
    }()
    
    // MARK: - Delegate
    weak var delegate: FoodMenuBaseViewDelegate?
    
    // MARK: - Private Properties
    private var datasourceTable: DatasourceMenuTableView?
    private var delegateTable: DelegateMenuTableView?
    private var delegateCollection: DelegateSectionCollectionView?
    private var datasourceCollection: DatasourceSectionCollectionView?
    
    // MARK: - Internal Init
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCode
extension FoodMenuBaseView: ViewConfigurationProtocol {
    func setupViewHierarchy() {
        [restaurantNameLabel, dividerRestaurantNameView, menuTitleLabel, dividerMenuView, menuSectionCollectionView, dividerRestaurantSectionView, menuTableView, backButton].forEach { view in
            addSubview(view)
        }
    }
    
    func setupConstraints() {
        restaurantNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(20.0)
            make.leading.equalTo(self.snp.leading).offset(20.0)
            make.trailing.equalTo(self.snp.trailing).offset(-20.0)
            make.height.equalTo(17.0)
        }
        
        dividerRestaurantNameView.snp.makeConstraints { make in
            make.top.equalTo(restaurantNameLabel.snp.bottom).offset(20.0)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(1.5)
        }
        
        menuTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(dividerRestaurantNameView.snp.bottom).offset(25.0)
            make.leading.equalTo(self.snp.leading).offset(20.0)
            make.trailing.equalTo(self.snp.trailing).offset(-20.0)
            make.height.equalTo(17.0)
        }
        
        dividerMenuView.snp.makeConstraints { make in
            make.top.equalTo(menuTitleLabel.snp.bottom).offset(20.0)
            make.leading.equalTo(self.snp.leading).offset(10.0)
            make.trailing.equalTo(self.snp.trailing).offset(-10.0)
            make.height.equalTo(1.5)
        }
        
        menuSectionCollectionView.snp.makeConstraints { make in
            make.top.equalTo(dividerMenuView.snp.bottom).offset(10.0)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.height.equalTo(50.0)
        }
        
        dividerRestaurantSectionView.snp.makeConstraints { make in
            make.top.equalTo(menuSectionCollectionView.snp.bottom).offset(1.0)
            make.leading.equalTo(self.snp.leading).offset(10.0)
            make.trailing.equalTo(self.snp.trailing).offset(-10.0)
            make.height.equalTo(1.5)
        }
        
        menuTableView.snp.makeConstraints { make in
            make.top.equalTo(dividerRestaurantSectionView.snp.bottom).offset(5.0)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottomMargin)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(10.0)
            make.leading.equalTo(15.0)
            make.width.equalTo(40.0)
            make.height.equalTo(30.0)
        }
    }
    
    func configureViews() {
        self.apply(background: .mainScreen)
        backButton.setImage(UIImage(named: "left-arrow"), for: .normal)
    }
}

// MARK: - Internal Function
extension FoodMenuBaseView {
    func set(viewModel: FoodMenuViewModel) {
        restaurantNameLabel.text = viewModel.restaurantName
        menuTitleLabel.text = screenText.menu
        datasourceCollection = DatasourceSectionCollectionView(viewModel: viewModel)
        delegateCollection = DelegateSectionCollectionView(viewModel: viewModel)
        menuSectionCollectionView.dataSource = datasourceCollection
        menuSectionCollectionView.delegate = delegateCollection
        menuSectionCollectionView.reloadData()
        datasourceTable = DatasourceMenuTableView(viewModel: viewModel)
        delegateTable = DelegateMenuTableView()
        menuTableView.delegate = delegateTable
        menuTableView.dataSource = datasourceTable
        menuTableView.reloadData()
    }
    
    func reloadTableView() {
        menuTableView.reloadData()
    }
    
    func reloadCollection() {
        menuSectionCollectionView.reloadData()
    }
}

// MARK: - Private Function
extension FoodMenuBaseView {
    @objc
    private func backButtonAction() {
        delegate?.backButtonTapped()
    }
}
