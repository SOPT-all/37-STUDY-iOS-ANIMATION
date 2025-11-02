//
//  TapGesturePractice.swift
//  37-iOS-animation
//
//  Created by 이나연 on 11/3/25.
//

import UIKit

import SnapKit
import Then

final class TapGesturePractice: UIViewController {
    private let ganadi = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
        view.addSubviews(ganadi)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        ganadi.do {
            $0.image = .ganadi
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = true
        }
    }
    
    private func setLayout() {
        ganadi.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            $0.height.equalTo(100)
        }
    }
    
    private func setAddTarget() {
        ganadi.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ganadiDidTap)))
    }
    
    @objc
    private func ganadiDidTap() {
        UIView.animate(withDuration: 1) {
            self.ganadi.transform = CGAffineTransform(rotationAngle: .pi)
        } completion: { _ in
            self.ganadi.transform = .identity
        }
    }
}
