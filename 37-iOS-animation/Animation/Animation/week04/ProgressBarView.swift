//
//  ProgressBarView.swift
//  Animation
//
//  Created by 진소은 on 12/15/25.
//

import UIKit

final class ProgressBarView: UIView {
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private var startPoint = CGFloat(-Double.pi / 2)
    private var endPoint = CGFloat(3 * Double.pi / 2)
    
    
    override func draw(_ rect: CGRect) {
        createCircularPath()
    }
    
    private func createCircularPath() {
        self.backgroundColor = .white
        
        let path = UIBezierPath(arcCenter: .init(x: self.frame.width / 2,
                                                 y: self.frame.height / 2),
                                radius: (frame.size.height - 10) / 2,
                                startAngle: startPoint,
                                endAngle: endPoint,
                                clockwise: true)
        
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.strokeEnd = 5
        circleLayer.strokeColor = UIColor.black.withAlphaComponent(0.4).cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = path.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 5
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.systemMint.cgColor
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration: TimeInterval, value: Double) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        
        circularProgressAnimation.toValue = value
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}
