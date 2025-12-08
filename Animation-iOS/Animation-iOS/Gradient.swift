//
//  Gradient.swift
//  Animation-iOS
//
//  Created by 송성용 on 11/3/25.
//

import UIKit

extension UIView {
    func applyGradient(colors: [UIColor], locations: [NSNumber]? = nil, startPoint: CGPoint = CGPoint(x: 0.5, y: 0.0), endPoint: CGPoint = CGPoint(x: 0.5, y: 1.0)) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.cornerRadius = self.layer.cornerRadius  

        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
