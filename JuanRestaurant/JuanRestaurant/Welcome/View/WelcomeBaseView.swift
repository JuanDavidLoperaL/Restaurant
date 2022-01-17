//
//  WelcomeBaseView.swift
//  JuanRestaurant
//
//  Created by Juan David Lopera Lopez on 13/01/22.
//

import SnapKit
import DesignSystem
import UIKit

protocol WelcomeBaseViewDelegate: AnyObject {
    func menuButtonTapped()
}

final class WelcomeBaseView: UIView {
    
    typealias screenText = AppText.Welcome
    
    // MARK: - Private UI Properties
    private let restaurantNameLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h1Medium(align: .center))
        return label
    }()
    
    private let informationStackView: UIStackView = {
        let stackView: UIStackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 5
        return stackView
    }()
    
    private let customerAttentionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h3Regular(align: .center))
        return label
    }()
    
    private let telephoneNumberLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h3Regular(align: .center))
        return label
    }()
    
    private let restaurantAddressLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h3Regular(align: .center))
        label.numberOfLines = 0
        return label
    }()
    
    private let menuButton: UIButton = {
        let button: UIButton = UIButton()
        button.apply(style: .primary)
        button.setTitle(screenText.menuButton, for: .normal)
        button.addTarget(self, action: #selector(menuButtonAction), for: .touchDown)
        return button
    }()
    
    private let loader: LoaderBaseView = LoaderBaseView()
    
    // MARK: - Delegate
    weak var delegate: WelcomeBaseViewDelegate?
    
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

// MARK: - ViewCode Configuration
extension WelcomeBaseView: ViewConfigurationProtocol {
    func setupViewHierarchy() {
        [restaurantNameLabel, informationStackView, menuButton, loader].forEach { view in
            addSubview(view)
        }
        [customerAttentionLabel, telephoneNumberLabel, restaurantAddressLabel].forEach { view in
            informationStackView.addArrangedSubview(view)
        }
    }
    
    func setupConstraints() {
        restaurantNameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.snp.topMargin).offset(100.0)
            make.leading.equalTo(self.snp.leading).offset(20.0)
            make.trailing.equalTo(self.snp.trailing).offset(-20.0)
        }
        
        informationStackView.snp.makeConstraints { make in
            make.top.equalTo(restaurantNameLabel.snp.bottom).offset(60.0)
            make.leading.equalTo(self.snp.leading).offset(20.0)
            make.trailing.equalTo(self.snp.trailing).offset(-20.0)
        }
        
        menuButton.snp.makeConstraints { make in
            make.top.equalTo(informationStackView.snp.bottom).offset(20.0)
            make.centerX.equalTo(self.snp.centerX)
            make.width.equalTo(70.0)
            make.height.equalTo(55.0)
        }
        
        loader.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.leading.equalTo(self.snp.leading)
            make.trailing.equalTo(self.snp.trailing)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
    
    func configureViews() {
        self.apply(background: .mainScreen)
        loader.setLoader(message: screenText.downloadMessage)
    }
}

// MARK: - Internal Function
extension WelcomeBaseView {
    func set(viewModel: WelcomeViewModel) {
        restaurantNameLabel.text = viewModel.restaurantName
        customerAttentionLabel.text = viewModel.hoursRestaurantOpen
        telephoneNumberLabel.text = viewModel.restaurantPhone
        restaurantAddressLabel.text = viewModel.restaurantAddress
    }
    
    func showLoader(with trackValue: CGFloat) {
        loader.showLoader(with: trackValue)
    }
    
    func hideLoader() {
        loader.isHidden = true
        loader.alpha = 0.0
    }
    
    func loaderFinished(withError: Bool) {
        if withError {
            loader.finishWithError()
        } else {
            loader.finish()
        }
    }
}

// MARK: - Private Function
extension WelcomeBaseView {
    @objc
    private func menuButtonAction() {
        delegate?.menuButtonTapped()
    }
}
