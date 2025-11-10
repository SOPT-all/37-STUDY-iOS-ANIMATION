//
//  ViewController.swift
//  week_02
//
//  Created by 조영서 on 11/3/25.
//

import UIKit
import SnapKit
import Then

final class ViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel().then {
        $0.text = "고냐니가 세상을 지배한다"
        $0.font = .systemFont(ofSize: 15, weight: .bold)
    }
    
    
    private let gonyani = UIImageView().then {
        $0.image = UIImage(named: "gonyani")
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    private let gonyani2 = UIImageView().then {
        $0.image = UIImage(named: "gonyani2")
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
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
        titleLabel.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(titleDidTap)))
        gonyani.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(gonyaniDidTap)))
        gonyani2.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(gonyani2DidTap)))
    }
    
    private func setLayout() {
        view.addSubviews(titleLabel, gonyani, gonyani2)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.centerX.equalToSuperview()
        }
        
        gonyani.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.leading.equalToSuperview().inset(30)
            $0.size.equalTo(170)
        }
        
        gonyani2.snp.makeConstraints {
            $0.centerY.equalTo(gonyani)
            $0.trailing.equalToSuperview().inset(30)
            $0.width.equalTo(100)
        }
    }
    
    // MARK: - Actions
    
    @objc private func titleDidTap() {
        UIView.animate(withDuration: 0.3) {
            self.gonyani.transform = .identity
            self.gonyani2.snp.makeConstraints {
                $0.centerY.equalTo(self.gonyani)
                $0.trailing.equalToSuperview().inset(30)
            }
        }
    }
    
    @objc private func gonyaniDidTap() {
        UIView.animateKeyframes(withDuration: 1.2, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.25) {
                self.gonyani.transform = CGAffineTransform(translationX: 0, y: -30)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.gonyani.transform = .identity
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.gonyani.transform = CGAffineTransform(translationX: 0, y: -20)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.gonyani.transform = .identity
            }
        }
    }
    
    @objc private func gonyani2DidTap(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: self.gonyani2)
        let changedX = gonyani2.center.x + transition.x
        let changedY = gonyani2.center.y + transition.y
        
        self.gonyani2.center = .init(x: changedX, y: changedY)
        sender.setTranslation(.zero, in: self.gonyani2)
    }
}
