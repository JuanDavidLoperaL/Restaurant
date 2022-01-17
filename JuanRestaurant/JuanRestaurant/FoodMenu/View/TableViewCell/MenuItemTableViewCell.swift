//
//  MenuItemTableViewCell.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import SnapKit
import DesignSystem
import UIKit

final class MenuItemTableViewCell: UITableViewCell {
    
    // MARK: - Private UI Properties
    private let plateNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h1Medium(align: .center))
        label.numberOfLines = 0
        return label
    }()
    
    private let plateDescriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h2Regular(align: .center, color: DSTextColor.body))
        label.numberOfLines = 0
        return label
    }()
    
    private let platePriceLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h3Regular(align: .center, color: DSTextColor.body))
        return label
    }()
    
    // MARK: - Static Properties
    static let cellIdentifier: String = "PlatesCell"
    
    // MARK: - Internal init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewCode
extension MenuItemTableViewCell: ViewConfigurationProtocol {
    func setupViewHierarchy() {
        [plateNameLabel, plateDescriptionLabel, platePriceLabel].forEach { view in
            contentView.addSubview(view)
        }
    }
    
    func setupConstraints() {
        plateNameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(20.0)
            make.leading.equalTo(contentView.snp.leading).offset(20.0)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20.0)
            make.height.equalTo(25.0)
        }
        
        platePriceLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(-25.0)
            make.leading.equalTo(contentView.snp.leading).offset(20.0)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20.0)
            make.height.equalTo(13.0)
        }
        
        plateDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(plateNameLabel.snp.bottom).offset(10.0)
            make.leading.equalTo(contentView.snp.leading).offset(20.0)
            make.trailing.equalTo(contentView.snp.trailing).offset(-20.0)
            make.bottom.equalTo(platePriceLabel.snp.top).offset(-10.0)
        }
    }
    
    func configureViews() {
        contentView.apply(background: .mainScreen)
        self.selectionStyle = .none
    }
}

// MARK: - Internal Function
extension MenuItemTableViewCell {
    func set(viewModel: FoodMenuViewModel) {
        plateNameLabel.text = viewModel.plateInformation.name
        plateDescriptionLabel.text = viewModel.plateInformation.description
        platePriceLabel.text = viewModel.plateInformation.price
    }
}
