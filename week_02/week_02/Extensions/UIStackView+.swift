//
//  UIStackView+.swift
//  week_02
//
//  Created by 조영서 on 11/3/25.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
