//
//  UIView+.swift
//  BaeminClone
//
//  Created by 조영서 on 10/18/25.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}
