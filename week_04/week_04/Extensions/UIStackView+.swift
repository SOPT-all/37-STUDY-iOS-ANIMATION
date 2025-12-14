//
//  UIStackView+.swift
//  week_04
//
//  Created by 조영서 on 12/9/25.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
