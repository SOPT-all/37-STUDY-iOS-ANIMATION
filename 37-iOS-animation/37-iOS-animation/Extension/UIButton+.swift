
//
//  UIButton_.swift
//  37-iOS-animation
//
//  Created by 이나연 on 10/25/25.
//

import UIKit

extension UIButton {
    func shakeButton() {
        self.transform = CGAffineTransform(translationX: 0, y: 20)
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
