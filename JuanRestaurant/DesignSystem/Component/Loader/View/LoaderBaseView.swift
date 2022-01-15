//
//  LoaderBaseView.swift
//  DesignSystem
//
//  Created by Juan David Lopera Lopez on 14/01/22.
//

import UIKit

public final class LoaderBaseView: UIView {
    
    // MARK: - Private Properties
    
    private let containerBackgroundView: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.white.withAlphaComponent(0.9)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let circleView: UIView = {
        let view: UIView = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let downloadDescriptionLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h1Medium(align: .center))
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let downloadPercentLabel: UILabel = {
        let label: UILabel = UILabel()
        label.apply(style: .h1Medium(align: .center))
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Private Properties
    private var progressLayer: CAShapeLayer = CAShapeLayer()
    private var trackLayer: CAShapeLayer = CAShapeLayer()
    private var trackValue: CGFloat = 0.0
    
    // MARK: - Public Init
    public init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoaderBaseView: ViewConfigurationProtocol {
    public func setupViewHierarchy() {
        [containerBackgroundView, circleView, downloadPercentLabel, downloadDescriptionLabel].forEach { view in
            addSubview(view)
        }
    }
    
    public func setupConstraints() {
        NSLayoutConstraint.activate([
            containerBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            containerBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            containerBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            containerBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            downloadPercentLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            downloadPercentLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -40),
            
            downloadDescriptionLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            downloadDescriptionLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 50.0),
        ])
        circleView.frame = CGRect(x: UIScreen.main.bounds.midX - 60.0, y: UIScreen.main.bounds.midY - 105.0, width: 120.0, height: 120.0)
    }
    
    public func configureViews() {
        apply(background: .clear)
        circleView.backgroundColor = .clear
        circleView.layer.cornerRadius = circleView.frame.size.width / 2
        let circleArcCenter: CGPoint = CGPoint(x: circleView.frame.size.width / 2, y: circleView.frame.size.height / 2)
        let circleRadius: CGFloat = (circleView.frame.size.width - 1.5) / 2
        let circleStartAngle: CGFloat = CGFloat(-0.5 * .pi)
        let circleEndAngle: CGFloat = CGFloat(1.5 * .pi)
        let circleBeizerPath: UIBezierPath = UIBezierPath(arcCenter: circleArcCenter,
                                                          radius: circleRadius,
                                                          startAngle: circleStartAngle,
                                                          endAngle: circleEndAngle,
                                                          clockwise: true)
        setupTrackLayer(with: circleBeizerPath)
        setupProgressLayer(with: circleBeizerPath)
    }
}

// MARK: - Public Function
public extension LoaderBaseView {
    public func setLoader(message: String) {
        downloadDescriptionLabel.text = message
    }
    
    func showLoader(with trackValue: CGFloat) {
        isHidden = false
        progressLayer.strokeEnd = trackValue
        let trackValueInPorcent: CGFloat = trackValue * 100.0
        downloadPercentLabel.text = String(format: "%.1f", trackValueInPorcent) + "%"
    }
    
    func finish() {
        let trackValueInPorcent: CGFloat = 100.0
        let trackValueInitialState: CGFloat = 0.0
        progressLayer.strokeEnd = trackValueInPorcent
        downloadPercentLabel.text = String(format: "%.1f", trackValueInPorcent) + "%"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isHidden = true
            self.progressLayer.strokeEnd = trackValueInitialState
        }
    }
    
    func finishWithError() {
        isHidden = true
        let trackValueInitialState: CGFloat = 0.0
        progressLayer.strokeEnd = trackValueInitialState
    }
}

// MARK: - Private Functions
extension LoaderBaseView {
    private func setupTrackLayer(with circlePath: UIBezierPath) {
        trackLayer.path = circlePath.cgPath
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.strokeColor = UIColor.lightGray.withAlphaComponent(0.5).cgColor
        trackLayer.lineWidth = 10.0
        trackLayer.strokeEnd = 1.0
        circleView.layer.addSublayer(trackLayer)
    }
    
    private func setupProgressLayer(with circlePath: UIBezierPath) {
        progressLayer.path = circlePath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.systemGreen.cgColor
        progressLayer.lineWidth = 10.0
        progressLayer.strokeEnd = 0.0
        circleView.layer.addSublayer(progressLayer)
    }
}
