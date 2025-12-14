//
//  UIView+.swift
//  week_04
//
//  Created by 조영서 on 12/9/25.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
