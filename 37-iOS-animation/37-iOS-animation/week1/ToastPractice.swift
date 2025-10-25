//
//  ToastViewPractice.swift
//  37-iOS-animation
//
//  Created by 이나연 on 10/25/25.
//


import UIKit

import SnapKit
import Then

final class ToastPractice: UIViewController {
    private let ganadi = UIImageView()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
        view.addSubviews(ganadi, button)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        ganadi.do {
            $0.image = .ganadi
            $0.contentMode = .scaleAspectFit
        }
        
        button.do {
            $0.setTitle( "버튼", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
    }
    
    private func setLayout() {
        ganadi.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            $0.height.equalTo(100)
        }
                
        button.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(50)
        }
    }
    
    private func setAddTarget() {
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
}

extension ToastPractice {
    @objc private func buttonDidTap() {
        view.showToast(title: "토스트메시지실습실습실습!")
    }
}


