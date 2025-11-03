//
//  UIView+.swift
//  Animation
//
//  Created by 진소은 on 11/3/25.
//


import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        views.forEach { self.addSubview($0) }
    }
}