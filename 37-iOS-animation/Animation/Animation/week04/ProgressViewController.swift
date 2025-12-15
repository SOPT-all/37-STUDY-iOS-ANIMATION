//
//  ProgressViewController.swift
//  Animation
//
//  Created by 진소은 on 12/15/25.
//

import UIKit

import SnapKit
import Then

final class ProgressViewController: UIViewController {
    
    private let progressView = ProgressBarView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()

        progressView.progressAnimation(duration: 2.0, value: 1.0)
    }
    
    private func setUI() {
        view.addSubview(progressView)
        
        progressView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(100)
        }
    }
}
