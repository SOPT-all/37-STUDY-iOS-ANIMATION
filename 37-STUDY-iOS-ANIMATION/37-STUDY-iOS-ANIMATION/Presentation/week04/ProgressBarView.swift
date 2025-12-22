//
//  ProgressBarView.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 12/15/25.
//

import UIKit

import SnapKit
import Then

final class ProgressBarView: BaseUIView {
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if circleLayer.superlayer == nil {
            createCircularPath()
        }
    }
}

extension ProgressBarView {
    private func createCircularPath() {
        let path = UIBezierPath(arcCenter: .init(x: self.frame.width / 2, y: self.frame.width / 2), radius: (frame.size.height - 10) / 2, startAngle: -CGFloat.pi / 2, endAngle: 1.5 * CGFloat.pi, clockwise: true)
        
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 10
        circleLayer.strokeEnd = 1
        circleLayer.strokeColor = UIColor.systemGray3.cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = path.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.systemBlue.cgColor
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
