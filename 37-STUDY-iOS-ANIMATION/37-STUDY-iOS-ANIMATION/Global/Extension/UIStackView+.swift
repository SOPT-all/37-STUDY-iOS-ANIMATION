//
//  UIStackView+.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 11/3/25.
//

import UIKit

extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
