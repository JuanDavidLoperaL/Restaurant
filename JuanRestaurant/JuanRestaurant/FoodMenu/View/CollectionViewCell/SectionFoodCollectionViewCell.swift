//
//  SectionFoodCollectionViewCell.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 15/01/22.
//

import DesignSystem
import UIKit

final class SectionFoodCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Private UI Properties
    private let sectionNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.numberOfLines = 0
        label.apply(style: .h2Regular(align: .center))
        return label
    }()
    
    private let selectedView: UIView = {
        let view: UIView = UIView()
        view.apply(background: .selectedDivider)
        view.isHidden = true
        return view
    }()
    
    // MARK: - Static Properties
    static let cellIdentifier: String = "sectionCell"
    
    // MARK: - Internal Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - ViewCode
extension SectionFoodCollectionViewCell: ViewConfigurationProtocol {
    func setupViewHierarchy() {
        [sectionNameLabel, selectedView].forEach { view in
            contentView.addSubview(view)
        }
    }
    
    func setupConstraints() {
        sectionNameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(5.0)
            make.leading.equalTo(contentView.snp.leading).offset(8.0)
            make.trailing.equalTo(contentView.snp.trailing).offset(-8.0)
            make.bottom.equalTo(contentView.snp.bottom).offset(-5.0)
        }
        
        selectedView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom)
            make.leading.equalTo(contentView.snp.leading).offset(8.0)
            make.trailing.equalTo(contentView.snp.trailing).offset(-8.0)
            make.height.equalTo(1.5)
        }
    }
    
    func configureViews() {
        contentView.apply(background: .mainScreen)
    }
}

// MARK: - Internal Function
extension SectionFoodCollectionViewCell {
    func set(viewModel: FoodMenuViewModel, currentIndex: Int) {
        sectionNameLabel.text = viewModel.sectionName
        selectedView.isHidden = !viewModel.shouldSelectedDividerBeActive(currentIndex: currentIndex)
    }
}
