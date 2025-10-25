//
//  ViewController.swift
//  37-iOS-animation
//
//  Created by 이나연 on 10/25/25.
//

import UIKit

import SnapKit
import Then

final class CGAffineTransformPractice: UIViewController {
    private let ganadi = UIImageView()
    private let transformButton = UIButton()
    private let rotateButton = UIButton()
    private let scaleButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
        view.addSubviews(ganadi, transformButton, rotateButton, scaleButton)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        ganadi.do {
            $0.image = .ganadi
            $0.contentMode = .scaleAspectFit
        }
        
        transformButton.do {
            $0.setTitle( "움직여보자", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
        
        rotateButton.do {
            $0.setTitle("회전시키자", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
        
        scaleButton.do {
            $0.setTitle("커지게해보자", for: .normal)
            $0.setTitleColor(.black, for: .normal)
        }
    }
    
    private func setLayout() {
        ganadi.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            $0.height.equalTo(100)
        }
        
        transformButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(rotateButton.snp.top).offset(-10)
        }
        
        rotateButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(scaleButton.snp.top).offset(-10)
        }
        
        scaleButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(30)
        }
    }
    
    private func setAddTarget() {
        transformButton.addTarget(self, action: #selector(transformDidTap), for: .touchUpInside)
        rotateButton.addTarget(self, action: #selector(rotateDidTap), for: .touchUpInside)
        scaleButton.addTarget(self, action: #selector(scaleDidTap), for: .touchUpInside)
    }
}

extension CGAffineTransformPractice {
    @objc private func transformDidTap() {
        //        UIView.animate(withDuration: 1) {
        //            self.ganadi.transform = CGAffineTransform(translationX: 100, y: 100)
        //        }
        
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4) {
                self.ganadi.transform = CGAffineTransform(translationX: 100, y: 100)
            }
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4) {
                self.ganadi.transform = CGAffineTransform(translationX: 100, y: -100)
            }
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4) {
                self.ganadi.transform = CGAffineTransform(translationX: -100, y: -100)
            }
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4) {
                self.ganadi.transform = CGAffineTransform(translationX: -100, y: 100)
            }
        }
    }
    
    @objc private func rotateDidTap() {
        //        UIView.animate(withDuration: 1) {
        //            self.ganadi.transform = CGAffineTransform(rotationAngle: .pi)
        //        }
        
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4) {
                self.ganadi.transform = self.ganadi.transform.rotated(by: .pi / 4)
            }
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4) {
                self.ganadi.transform = self.ganadi.transform.rotated(by: .pi / 4)
            }
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4) {
                self.ganadi.transform = self.ganadi.transform.rotated(by: .pi / 4)
            }
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4) {
                self.ganadi.transform = self.ganadi.transform.rotated(by: .pi / 4)
            }
        }
    }
    
    @objc private func scaleDidTap() {
        //        UIView.animate(withDuration: 1) {
        //            self.ganadi.transform = CGAffineTransform(scaleX: 5, y: 5 )
        
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4) {
                self.ganadi.transform = self.ganadi.transform.scaledBy(x: 2, y: 2)
            }
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4) {
                self.ganadi.transform = self.ganadi.transform.scaledBy(x: 2, y: 2)
            }
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4) {
                self.ganadi.transform = self.ganadi.transform.scaledBy(x: 0.5, y: 0.5)
            }
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4) {
                self.ganadi.transform = self.ganadi.transform.scaledBy(x: -0.5, y: -0.5)
            }
        }
    }
}


