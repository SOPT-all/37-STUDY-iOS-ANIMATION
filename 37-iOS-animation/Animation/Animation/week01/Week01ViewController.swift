//
//  week01.swift
//  Animation
//
//  Created by 진소은 on 11/3/25.
//

import UIKit
import SnapKit
import Then

final class Week01ViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let imageView = UIImageView().then {
        $0.image = UIImage(named: "img_damgom")
        $0.contentMode = .scaleAspectFit
    }
    
    private let animateButton = UIButton(type: .system).then {
        $0.setTitle("담곰아 춤추자", for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.titleLabel?.font = .systemFont(ofSize: 16)
    }
    
    private let toastButton = UIButton(type: .system).then {
        $0.setTitle("토스트 굽기", for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.titleLabel?.font = .systemFont(ofSize: 16)
    }
    
    private let shakeButton = UIButton(type: .system).then {
        $0.setTitle("부르르르", for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 8
        $0.titleLabel?.font = .systemFont(ofSize: 16)
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setUI()
        setActions()
    }
    
    // MARK: - Set UI
    
    private func setUI() {
        view.addSubviews(imageView, animateButton, toastButton, shakeButton)
        
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-100)
            $0.width.height.equalTo(150)
        }
        
        animateButton.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(80)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(140)
            $0.height.equalTo(44)
        }
        
        toastButton.snp.makeConstraints {
            $0.top.equalTo(animateButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(140)
            $0.height.equalTo(44)
        }
        
        shakeButton.snp.makeConstraints {
            $0.top.equalTo(toastButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(140)
            $0.height.equalTo(44)
        }
    }
    
    // MARK: - Actions
    
    private func setActions() {
        animateButton.addTarget(self, action: #selector(animateImage), for: .touchUpInside)
        toastButton.addTarget(self, action: #selector(showToastTapped), for: .touchUpInside)
        shakeButton.addTarget(self, action: #selector(shakeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func animateImage() {
        let originalCenter = imageView.center
        let originalTransform = imageView.transform
        
        UIView.animate(withDuration: 1.0, animations: {
            self.imageView.center.x += 80
        }) { _ in
            UIView.animate(withDuration: 1.0, animations: {
                self.imageView.transform = self.imageView.transform.rotated(by: .pi)
            }) { _ in
                UIView.animate(withDuration: 1.0, animations: {
                    self.imageView.transform = self.imageView.transform.scaledBy(x: 1.5, y: 1.5)
                }) { _ in
                    UIView.animate(withDuration: 1.0) {
                        self.imageView.transform = originalTransform
                        self.imageView.center = originalCenter
                    }
                }
            }
        }
    }
    
    @objc private func showToastTapped() {
        view.showToastMessage()
    }
    
    @objc private func shakeButtonTapped() {
        shakeButton.shakeButton()
    }
}
