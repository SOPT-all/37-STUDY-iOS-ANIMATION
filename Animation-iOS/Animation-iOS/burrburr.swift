//
//  burrburr.swift
//  Animation-iOS
//
//  Created by 송성용 on 11/3/25.
//

import Foundation
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
