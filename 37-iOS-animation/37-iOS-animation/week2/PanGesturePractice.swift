//
//  PanGesturePractice.swift
//  37-iOS-animation
//
//  Created by 이나연 on 11/3/25.
//

import UIKit

import SnapKit
import Then

final class PanGesturePractice: UIViewController {
    private let ganadi = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
        setAddTarget()
    }
    
    private func setUI() {
        view.addSubviews(ganadi)
    }
    
    private func setStyle() {
        view.backgroundColor = .white
        
        ganadi.do {
            $0.image = .ganadi
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = true
        }
    }
    
    private func setLayout() {
        ganadi.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(10)
            $0.height.equalTo(100)
        }
    }
    
    private func setAddTarget() {
        ganadi.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(ganadiDidTap(_:))))
    }
    
    @objc
    private func ganadiDidTap(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: self.ganadi)
        let changedX = ganadi.center.x + transition.x
        let changedY = ganadi.center.y + transition.y
        
        self.ganadi.center = .init(x: changedX, y: changedY)
        sender.setTranslation(.zero, in: self.ganadi)
    }
    
    @objc
    private func printPanState(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
        case .possible:
            print("현재 상태: possible")
        case .began:
            print("현재 상태: began")
        case .changed:
            print("현재 상태: changed")
        case .ended:
            print("현재 상태: ended")
        case .cancelled:
            print("현재 상태: cancelled")
        case .failed:
            print("현재 상태: failed")
        @unknown default:
            print("현재 상태: unknown")
        }
    }
}
