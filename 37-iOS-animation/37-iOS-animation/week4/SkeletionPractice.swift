//
//  SkeletionPractice.swift
//  37-iOS-animation
//
//  Created by 이나연 on 12/1/25.
//

import UIKit

import SnapKit
import Then

final class SkeletionPractice: UIViewController {
    private let label = UILabel()
    private let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        
        skeletonAnimate()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubviews(label, imageView)
    }
    
    private func setStyle() {
        label.do {
            $0.text = "로딩중...."
        }
        
        imageView.do {
            $0.backgroundColor = .gray
        }
    }
    
    private func setLayout() {
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(200)
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label.snp.bottom).offset(20)
            $0.width.equalTo(230)
            $0.height.equalTo(200)
        }
    }
    
    private func skeletonAnimate() {
        label.backgroundColor = .gray
        
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.label.alpha = 0.4
                self.imageView.alpha = 0.4
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 1) {
                self.label.alpha = 1
                self.imageView.alpha = 1
                
            }
        } completion: { _ in
            self.bind()
        }
    }
    
    private func bind() {
        label.do {
            $0.text = "짠!!"
            $0.backgroundColor = .clear
        }
        
        imageView.do {
            $0.image = .ganadi5
            $0.backgroundColor = .clear
        }
    }
}
