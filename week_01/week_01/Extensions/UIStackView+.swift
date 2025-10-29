//
//  UIStackView+.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
