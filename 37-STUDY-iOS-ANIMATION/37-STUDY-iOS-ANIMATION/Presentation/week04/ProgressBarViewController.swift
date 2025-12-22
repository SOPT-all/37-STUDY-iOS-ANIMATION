//
//  ProgressBarViewController.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 12/15/25.
//

import UIKit

import SnapKit
import Then

class ProgressBarViewController: BaseUIViewController {
    private let progressBar = ProgressBarView()
    
    override func setUI() {
        view.addSubview(progressBar)
    }
    
    override func setLayout() {
        progressBar.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
            $0.size.equalTo(200)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        progressBar.progressAnimation(duration: 2.0, value: 1)
    }
}
