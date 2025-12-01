//
//  InfinityCarouselViewController.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 12/1/25.
//


import UIKit

import Then
import SnapKit

final class InfinityCarouselViewController: BaseUIViewController {
    private let label = UILabel().then {
        $0.text = "🎡 무한 캐러셀 🎡"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .cyan
    }
    private let carouselView = InfinityCarouselView()

    override func setUI() {
        view.addSubviews(label, carouselView)
    }

    override func setLayout() {
        label.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        carouselView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(80)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
    }
}
