//
//  ProgressBarViewController.swift
//  week_04
//
//  Created by 조영서 on 12/9/25.
//

import UIKit

import SnapKit
import Then

final class ProgressBarViewController: UIViewController {

    // MARK: - UI Components

    private let circleLayer = CAShapeLayer()
    private let progressLayer = CAShapeLayer()

    // MARK: - Properties

    private let startAngle = -CGFloat.pi / 2
    private let endAngle = 3 * CGFloat.pi / 2
    private let progressSize: CGFloat = 140

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCircularPath()
        startProgressAnimation()
    }

    // MARK: - Private Methods

    private func setupCircularPath() {
        let center = CGPoint(
            x: view.bounds.width / 2,
            y: view.bounds.height / 2
        )

        let radius = progressSize / 2

        let path = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: true
        )

        setupLayers(with: path.cgPath)
    }

    private func setupLayers(with path: CGPath) {
        circleLayer.path = path
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.strokeColor = UIColor.softPink.cgColor
        circleLayer.lineWidth = 8
        circleLayer.lineCap = .round
        view.layer.addSublayer(circleLayer)

        progressLayer.path = path
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.strokeColor = UIColor.indigoNavy.cgColor
        progressLayer.lineWidth = 8
        progressLayer.lineCap = .round
        progressLayer.strokeEnd = 0
        view.layer.addSublayer(progressLayer)
    }

    private func startProgressAnimation() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2.5
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        animation.isRemovedOnCompletion = false

        progressLayer.add(animation, forKey: "ProgressAnimation")
    }
}
