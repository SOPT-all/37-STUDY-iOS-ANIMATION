//
//  ButtonViewController.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 11/3/25.
//

import UIKit

import Then
import SnapKit

final class ButtonViewController: BaseUIViewController {
    
    // MARK: - UI Components
    
    private let button1 = UIButton().then {
        $0.setTitle("토스트를 굽자 🍞", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBrown
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }
    
    private let button2 = UIButton().then {
        $0.setTitle("너무 추워요 🥶", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = .systemBlue
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }
    
    private let buttonStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 20
    }
    
    private lazy var toastMesssage = ToastMessage(title: "토스트 메세지다").then {
        $0.isHidden = true
    }
    
    
    // MARK: - SetUI
    
    override func setUI() {
        view.addSubviews(buttonStackView, toastMesssage)
        buttonStackView.addArrangedSubviews(button1, button2)
    }
    
    
    // MARK: - SetLayout
    
    override func setLayout() {
        buttonStackView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(110)
        }
        
        toastMesssage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(115)
        }
    }
    
    
    // MARK: - AddTarget
    
    override func addTarget() {
        button1.addTarget(self, action: #selector(makeToast), for: .touchUpInside)
        button2.addTarget(self, action: #selector(makeButtonBurr), for: .touchUpInside)
    }
}

extension ButtonViewController {
    
    @objc public func makeToast() {
        toastMesssage.isHidden = false
        toastMesssage.alpha = 0

        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2) {
                self.toastMesssage.alpha = 1.0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.6) {
                self.toastMesssage.alpha = 1.0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.2) {
                self.toastMesssage.alpha = 0.0
            }
        }, completion: { _ in
            self.toastMesssage.isHidden = true
        })
    }
    
    @objc func makeButtonBurr(duration: TimeInterval = 0.5, xValue: CGFloat = 12, yValue: CGFloat = 0) {
        self.button2.transform = CGAffineTransform(translationX: 12, y: 12)
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            usingSpringWithDamping: 0.4,
            initialSpringVelocity: 1.0,
            options: .curveEaseInOut
        ) {
            self.button2.transform = .identity
        }
    }
}
