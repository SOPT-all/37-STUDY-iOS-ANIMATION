//
//  ViewController.swift
//  AnimationStudy
//
//  Created by 신혜연 on 11/3/25.
//

import UIKit

import SnapKit
import Then

class ViewController: UIViewController {
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(resource: .bubble)
        $0.isUserInteractionEnabled = true
    }
    
    private let button = UIButton().then {
        $0.contentMode = .center
        $0.setTitle("누르지마", for: .normal)
        $0.backgroundColor = .orange
        $0.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        addTarget()
    }
    
    private func setUI() {
        view.addSubviews(imageView, button)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
    }
    
    private func addTarget() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(scaleDidTap))
        imageView.addGestureRecognizer(tapGesture)
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc private func scaleDidTap() {
        
        self.imageView.transform = .identity
        
        UIView.animateKeyframes(withDuration: 2.5, delay: 0, options: [], animations: {
            
            // 오른쪽 아래로 이동
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.2) {
                self.imageView.transform = CGAffineTransform(translationX: 20, y: -50)
            }
            
            // 이동한 상태에서 2배 커지기
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.4) {
                // 이동한 상태에서 커지기
                let translation = CGAffineTransform(translationX: 20, y: -50)
                let scale = CGAffineTransform(scaleX: 3.0, y: 3.0)
                self.imageView.transform = translation.concatenating(scale)
            }
            
            // 원래 상태로 복귀
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.4) {
                self.imageView.transform = .identity
            }
            
        }, completion: { finished in
            if finished {
                self.imageView.transform = .identity
            }
        })
    }
    
    @objc private func buttonDidTap() {
        button.shakeButton()
        view.showToast(title: "누르지말랬디!!!")
    }
}

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}

public extension UIView {
    func showToast(title: String) {
        let toastView = ToastView(title: title)
        self.addSubview(toastView)
        
        toastView.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(100)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(40)
        }
        
        toastView.layer.cornerRadius = 8
        UIView.animate(withDuration: 1) {
            toastView.alpha = 0
        } completion: { _ in
            toastView.removeFromSuperview()
        }
    }
}

extension UIButton {
    func shakeButton() {
        self.transform = CGAffineTransform(translationX: 0, y: 10)
        UIView.animate(
            withDuration: 0.3,
            delay: 0,
            usingSpringWithDamping: 0.2,
            initialSpringVelocity: 1
        ) {
            self.transform = .identity
        }
    }
}

#Preview {
    ViewController()
}
