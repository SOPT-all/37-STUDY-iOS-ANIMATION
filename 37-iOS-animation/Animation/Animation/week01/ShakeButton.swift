//
//  ShakeButton.swift
//  Animation
//
//  Created by 진소은 on 11/3/25.
//

import UIKit

extension UIButton {
    func shakeButton() {
        self.transform = CGAffineTransform(translationX: 20, y: 0)
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
