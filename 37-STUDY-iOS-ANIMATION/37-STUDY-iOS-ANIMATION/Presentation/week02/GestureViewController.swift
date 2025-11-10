//
//  GestureViewController.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 11/10/25.
//

import UIKit

import Then
import SnapKit

final class GestureViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    private lazy var title1label = UILabel().then {
        $0.textAlignment = .center
        $0.text = "나를 눌러보세요"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .systemGray2
    }
    
    private lazy var oni1Image = UIImageView().then {
        $0.image = .oni
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    private let title2label = UILabel().then {
        $0.textAlignment = .center
        $0.text = "나를 움직여보세요"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .systemGray2
    }
    
    private let oni2Image = UIImageView().then {
        $0.image = .oni
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    
    // MARK: - SetUI
    
    override func setUI() {
        view.addSubviews(title1label, oni1Image, title2label, oni2Image)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        title1label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(100)
        }
        
        oni1Image.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(title1label.snp.bottom).offset(20)
            $0.height.equalTo(200)
        }
        
        title2label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(oni1Image.snp.bottom).offset(80)
        }
        
        oni2Image.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(title2label.snp.bottom).offset(20)
            $0.height.equalTo(200)
        }
    }
    
    
    // MARK: - AddTarget
    
    override func addTarget() {
        oni1Image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(oniDidTap)))
        oni2Image.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(oniDidMove(_:))))
    }
}

extension GestureViewController {
    @objc private func oniDidTap() {
        let originalText = self.title1label.text
        let originalColor = self.title1label.textColor
        
        UIView.animate(withDuration: 1) {
            UIView.animateKeyframes(withDuration: 1, delay: 0) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3) {
                    self.oni1Image.transform = CGAffineTransform(rotationAngle: .pi*1.2)
                }
                UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3) {
                    self.oni1Image.transform = CGAffineTransform(rotationAngle: .pi*2.4)
                }
                UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3) {
                    self.oni1Image.transform = CGAffineTransform(rotationAngle: .pi*4)
                }
            }
        }
        
        UIView.transition(with: self.title1label, duration: 0.2, options: .transitionCrossDissolve) {
            self.title1label.text = "어지러~~~"
            self.title1label.textColor = .systemRed
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
            UIView.transition(with: self.title1label, duration: 0.1, options: .transitionCrossDissolve) {
                self.title1label.text = originalText
                self.title1label.textColor = originalColor
            }
        }
    }
    
    @objc private func oniDidMove(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: self.oni2Image)
        let changedX = oni2Image.center.x + transition.x
        let changedY = oni2Image.center.y + transition.y
        self.oni2Image.center = .init(x: changedX, y: changedY)
        sender.setTranslation(.zero, in: self.oni2Image)
    }
}
