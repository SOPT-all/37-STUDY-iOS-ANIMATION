//
//  SkeletonViewController.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 12/15/25.
//

import UIKit

import SnapKit
import Then

final class SkeletonViewController: BaseUIViewController {
    private let label = UILabel().then {
        $0.text = "💀 해골해골 💀"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .cyan
        $0.isHidden = true
    }
    
    private let label2 = UILabel().then {
        $0.text = "🩻 스켈레톤 🩻"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .cyan
        $0.isHidden = true
    }
    
    private let sansImage = UIImageView().then {
        $0.image = .sans
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    
    private let skeletonLabel1 = UIView().then {
        $0.backgroundColor = .systemGray5
    }
        
    private let skeletonLabel2 = UIView().then {
        $0.backgroundColor = .systemGray5
    }
        
    private let skeletonImage = UIView().then {
        $0.backgroundColor = .systemGray5
    }
    
    override func setUI() {
        view.addSubviews(skeletonLabel1, skeletonLabel2, skeletonImage, label, label2, sansImage)
    }
    
    override func setLayout() {
        skeletonLabel1.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(150)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(180)
            $0.height.equalTo(30)
        }
                
        skeletonImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(180)
        }
                
        skeletonLabel2.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-200)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(130)
            $0.height.equalTo(30)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(150)
            $0.centerX.equalToSuperview()
        }
        
        sansImage.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(50)
        }
        
        label2.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).offset(-200)
            $0.centerX.equalToSuperview()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        skeletonAnimate()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.showRealContent()
        }
    }
}

extension SkeletonViewController {
    private func skeletonAnimate() {
        label.backgroundColor = .gray
        
        UIView.animateKeyframes(withDuration: 0.8, delay: 0, options: [.repeat, .autoreverse]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.skeletonLabel1.alpha = 0.4
                self.skeletonLabel2.alpha = 0.4
                self.skeletonImage.alpha = 0.4
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1) {
                self.skeletonLabel1.alpha = 1
                self.skeletonLabel2.alpha = 1
                self.skeletonImage.alpha = 1
            }
        }
    }
    
    private func showRealContent() {
        label.alpha = 0
        label2.alpha = 0
        sansImage.alpha = 0
        
        label.isHidden = false
        label2.isHidden = false
        sansImage.isHidden = false
        
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut,
            animations: {
                self.skeletonLabel1.alpha = 0
                self.skeletonLabel2.alpha = 0
                self.skeletonImage.alpha = 0
                
                self.label.alpha = 1
                self.label2.alpha = 1
                self.sansImage.alpha = 1
            },
            completion: { _ in
                self.skeletonLabel1.removeFromSuperview()
                self.skeletonLabel2.removeFromSuperview()
                self.skeletonImage.removeFromSuperview()
            }
        )
    }
}
