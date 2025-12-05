//
//  ProgressBarPractice.swift
//  37-iOS-animation
//
//  Created by 이나연 on 12/1/25.
//

import UIKit

import SnapKit

final class ProgressBarPractice: UIViewController {
    private let progressView = ProgressBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(progressView)
        view.backgroundColor = .white
        
        progressView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        progressView.progressAnimation(duration: 5, value: 1)
    }
}
