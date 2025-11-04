//
//  ViewController.swift
//  week_01
//
//  Created by 조영서 on 10/28/25.
//

import UIKit
import SnapKit
import Then

final class ViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let gonyani = UIImageView(image: UIImage(named: "gonyani")).then {
        $0.contentMode = .scaleAspectFit
    }
    
    private let transformButton = UIButton(type: .system).then {
        $0.setTitle("움직여보자", for: .normal)
    }
    
    private let resetButton = UIButton(type: .system).then {
        $0.setTitle("리셋해보자", for: .normal)
    }
    
    private let rotateButton = UIButton(type: .system).then {
        $0.setTitle("회전시켜보자", for: .normal)
    }
    
    private let scaleButton = UIButton(type: .system).then {
        $0.setTitle("커지게해보자", for: .normal)
    }
    
    private let toastButton = UIButton(type: .system).then {
        $0.setTitle("토스트띄워보자", for: .normal)
        $0.backgroundColor = .black
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
    }
    
    private let brbrButton = UIButton(type: .system).then {
        $0.setTitle("부르르르", for: .normal)
        $0.backgroundColor = .black
        $0.tintColor = .white
        $0.layer.cornerRadius = 10
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTarget()
        setLayout()
    }
    
    // MARK: - Setup Methods
    
    private func setTarget() {
        resetButton.addTarget(self, action: #selector(resetDidTap), for: .touchUpInside)
        transformButton.addTarget(self, action: #selector(transformDidTap), for: .touchUpInside)
        rotateButton.addTarget(self, action: #selector(rotateDidTap), for: .touchUpInside)
        scaleButton.addTarget(self, action: #selector(scaleDidTap), for: .touchUpInside)
        toastButton.addTarget(self, action: #selector(toastDidTap), for: .touchUpInside)
        brbrButton.addTarget(self, action: #selector(brbrDidTap), for: .touchUpInside)
    }
    
    private func setLayout() {
        view.addSubviews(gonyani, resetButton, transformButton, rotateButton, scaleButton, toastButton, brbrButton)
        
        gonyani.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(100)
        }
        
        resetButton.snp.makeConstraints {
            $0.top.equalTo(gonyani.snp.bottom).offset(250)
            $0.centerX.equalToSuperview()
        }
        
        transformButton.snp.makeConstraints {
            $0.top.equalTo(resetButton.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        rotateButton.snp.makeConstraints {
            $0.top.equalTo(transformButton.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        scaleButton.snp.makeConstraints {
            $0.top.equalTo(rotateButton.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
        }
        
        toastButton.snp.makeConstraints {
            $0.top.equalTo(scaleButton.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
        }
        
        brbrButton.snp.makeConstraints {
            $0.top.equalTo(toastButton.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(200)
        }
    }
    
    // MARK: - Actions
    
    @objc private func resetDidTap() {
        UIView.animate(withDuration: 0.3) {
            self.gonyani.transform = .identity
        }
    }
    
    @objc private func transformDidTap() {
        UIView.animate(withDuration: 0.3) {
            self.gonyani.transform = CGAffineTransform(translationX: 80, y: 80)
        }
    }
    
    @objc private func rotateDidTap() {
        UIView.animate(withDuration: 0.3) {
            self.gonyani.transform = CGAffineTransform(rotationAngle: .pi)
        }
    }
    
    @objc private func scaleDidTap() {
        UIView.animate(withDuration: 0.3) {
            self.gonyani.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
    }
    
    @objc private func toastDidTap() {
        showToast(message: "토스트 메시지🍞")
    }
    
    @objc private func brbrDidTap() {
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 1) {
            self.brbrButton.transform = CGAffineTransform(translationX: 0, y: -8)
        } completion: { _ in
            self.brbrButton.transform = .identity
        }
    }
    
    // MARK: - Private Methods
    
    private func showToast(message: String) {
        let label = UILabel()
        label.text = message
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.backgroundColor = .orange
        label.layer.cornerRadius = 8
        label.clipsToBounds = true
        label.alpha = 0
        
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(80)
            $0.width.equalTo(240)
            $0.height.equalTo(36)
        }
        
        UIView.animate(withDuration: 0.3) {
            label.alpha = 1
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 1.0) {
                label.alpha = 0
            } completion: { _ in
                label.removeFromSuperview()
            }
        }
    }
}
