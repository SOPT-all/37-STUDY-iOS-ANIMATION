//
//  LottieViewController.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 12/15/25.
//

import UIKit

import Lottie
import Then
import SnapKit

final class LottieViewController: BaseUIViewController {
    private let lottieView = LottieAnimationView(name: "bori_cake")
    
    override func setUI() {
        view.addSubviews(lottieView)
    }
    
    override func setLayout() {
        lottieView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func addTarget() {
        startAnimation()
    }
}

extension LottieViewController {
    func startAnimation() {
        lottieView.loopMode = .loop
        lottieView.play()
    }
}
