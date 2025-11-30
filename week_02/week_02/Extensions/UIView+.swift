//
//  UIView+.swift
//  week_02
//
//  Created by 조영서 on 11/3/25.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
