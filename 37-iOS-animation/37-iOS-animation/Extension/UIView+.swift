//
//  UIView+.swift
//  37-iOS-animation
//
//  Created by 이나연 on 10/25/25.
//

import UIKit

import SnapKit


public extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
    
    func showToast(title: String) {
        let toastView = ToastView(title: title)
        self.addSubview(toastView)
        
        toastView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        toastView.layer.cornerRadius = 8
        UIView.animate(withDuration: 1) {
            toastView.alpha = 0
        } completion: { _ in
            toastView.removeFromSuperview()
        }
    }
}
