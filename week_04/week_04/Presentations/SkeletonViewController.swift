//
//  SkeletonViewController.swift
//  week_04
//
//  Created by 조영서 on 12/9/25.
//

import UIKit

import SnapKit
import Then

final class SkeletonViewController: UIViewController {

    // MARK: - UI Components

    private let gonyaniImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .gray
    }

    private let loadingLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        $0.textAlignment = .center
        $0.backgroundColor = .gray
    }

    // MARK: - State

    private var isSkeletonActive = false

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
        startSkeleton()
        loadImage()
    }

    // MARK: - Setup Methods

    private func setUI() {
        view.addSubviews(gonyaniImageView, loadingLabel)
    }

    private func setLayout() {
        gonyaniImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(200)
        }

        loadingLabel.snp.makeConstraints {
            $0.top.equalTo(gonyaniImageView.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(22)
        }
    }

    // MARK: - Private Methods

    private func startSkeleton() {
        isSkeletonActive = true

        gonyaniImageView.image = nil
        loadingLabel.text = nil

        skeletonAnimate()
    }

    private func skeletonAnimate() {
        guard isSkeletonActive else { return }

        UIView.animateKeyframes(
            withDuration: 1.2,
            delay: 0,
            options: [.calculationModeLinear]
        ) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.gonyaniImageView.alpha = 0.4
                self.loadingLabel.alpha = 0.4
            }

            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.gonyaniImageView.alpha = 1
                self.loadingLabel.alpha = 1
            }
        } completion: { _ in
            self.skeletonAnimate()
        }
    }

    private func stopSkeleton() {
        isSkeletonActive = false

        gonyaniImageView.layer.removeAllAnimations()
        loadingLabel.layer.removeAllAnimations()

    }

    private func loadImage() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.stopSkeleton()

            self.gonyaniImageView.backgroundColor = .clear
            self.loadingLabel.backgroundColor = .clear

            self.gonyaniImageView.image = .imgGonyani3
            self.loadingLabel.text = "Ｌｏａｄｉｎｇ ..."
            self.loadingLabel.textColor = .label
        }
    }
}
