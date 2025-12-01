//
//  Week1ViewController.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 11/3/25.
//

import UIKit

import Then
import SnapKit

final class Week1ViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    private let dumplingImage = UIImageView().then {
        $0.image = .dumpling
        $0.contentMode = .scaleAspectFit
    }
    
    private let button1 = UIButton().then {
        $0.setTitle("움직이기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    private let button2 = UIButton().then {
        $0.setTitle("회전시키기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    private let button3 = UIButton().then {
        $0.setTitle("커지게 하기", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 8
        $0.layer.masksToBounds = true
    }
    
    private let buttonStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 12
    }
    
    
    // MARK: - SetUI
    
    override func setUI() {
        view.addSubviews(dumplingImage, buttonStackView)
        buttonStackView.addArrangedSubviews(button1, button2, button3)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        dumplingImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(250)
            $0.width.height.equalTo(200)
        }
        
        buttonStackView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(80)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(45)
        }
    }
    
    
    // MARK: - AddTarget
    
    override func addTarget() {
        button1.addTarget(self, action: #selector(transformDidTap), for: .touchUpInside)
        button2.addTarget(self, action: #selector(rotateDidTap), for: .touchUpInside)
        button3.addTarget(self, action: #selector(scaleDidTap), for: .touchUpInside)
    }
}

extension Week1ViewController {
    @objc private func transformDidTap() {
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4) {
                self.dumplingImage.transform = CGAffineTransform(translationX: 10, y: -100)
              }
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4) {
                self.dumplingImage.transform = CGAffineTransform(translationX: -10, y: -50)
            }
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4) {
                self.dumplingImage.transform = CGAffineTransform(translationX: 10, y: -20)
            }
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4) {
                self.dumplingImage.transform = .identity
            }
        }
    }
        
    @objc private func rotateDidTap() {
        UIView.animate(withDuration: 1) {
            UIView.animateKeyframes(withDuration: 3, delay: 0) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3) {
                    self.dumplingImage.transform = CGAffineTransform(rotationAngle: .pi)
                  }
                UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3) {
                    self.dumplingImage.transform = CGAffineTransform(rotationAngle: .pi)
                }
                UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3) {
                    self.dumplingImage.transform = .identity
                }
            }
        }
    }
        
    @objc private func scaleDidTap() {
        UIView.animate(withDuration: 1) {
            UIView.animateKeyframes(withDuration: 3, delay: 0) {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3) {
                    self.dumplingImage.transform = CGAffineTransform(scaleX: 2, y: 0.5)
                  }
                UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3) {
                    self.dumplingImage.transform = CGAffineTransform(scaleX: 0.5, y: 4)
                }
                UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3) {
                    self.dumplingImage.transform = .identity
                }
            }
        }
    }
}
