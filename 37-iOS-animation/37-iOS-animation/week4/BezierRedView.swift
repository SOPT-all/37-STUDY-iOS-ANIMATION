//
//  BezierRedView.swift
//  37-iOS-animation
//
//  Created by 이나연 on 12/1/25.
//

import UIKit

final class RedView: UIView {
    override func draw(_ rect: CGRect) {
        //        drawSquare()
        drawCircle()
    }
    
    private func drawSquare() {
        let path = UIBezierPath(rect: CGRect(x: self.bounds.midX-50,
                                             y: self.bounds.midY-50,
                                             width: 100,
                                             height: 100))
        
        UIColor.red.setFill()
        UIColor.yellow.setStroke()
        path.lineWidth = 10
        path.stroke()
        path.fill()
    }
    
    private func drawCircle() {
        let path = UIBezierPath(ovalIn: CGRect(x: bounds.midX - 50,
                                               y: bounds.midY - 50,
                                               width: 100,
                                               height: 100))
        UIColor.systemRed.setFill()
        UIColor.systemYellow.setStroke()
        path.lineWidth = 10
        path.stroke()
        path.fill()
    }
}
