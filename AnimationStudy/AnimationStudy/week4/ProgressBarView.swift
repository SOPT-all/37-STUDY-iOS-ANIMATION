//
//  ProgressBarView.swift
//  AnimationStudy
//
//  Created by 신혜연 on 12/2/25.
//

import UIKit
import SnapKit

class ProgressBarView: UIView {
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    private let lineWidth: CGFloat = 20

    override var intrinsicContentSize: CGSize {
        return CGSize(width: 180, height: 180)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createCircularPath()
    }
    
    private func setStyle() {
        self.backgroundColor = .white
    }
    
    private func createCircularPath() {
        guard self.frame.width > 0 else { return }
        
        let centerPoint = CGPoint(x: self.bounds.width / 2, y: self.bounds.height / 2)
        let radius = (self.bounds.width - lineWidth) / 2
        
        let circularPath = UIBezierPath(arcCenter: centerPoint,
                                        radius: radius,
                                        startAngle: -CGFloat.pi / 2,
                                        endAngle: 1.5 * CGFloat.pi,
                                        clockwise: true)
        
        if circleLayer.superlayer == nil {
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            circleLayer.lineWidth = lineWidth
            circleLayer.strokeEnd = 1.0
            circleLayer.strokeColor = UIColor.systemGray5.cgColor
            layer.addSublayer(circleLayer)
        }
        circleLayer.path = circularPath.cgPath
        
        if progressLayer.superlayer == nil {
            progressLayer.fillColor = UIColor.clear.cgColor
            progressLayer.lineCap = .round
            progressLayer.lineWidth = lineWidth
            progressLayer.strokeEnd = 0
            progressLayer.strokeColor = UIColor.gray.cgColor
            layer.addSublayer(progressLayer)
        }
        progressLayer.path = circularPath.cgPath
    }
    
    func setProgressWithAnimation(duration: TimeInterval, value: Double) {
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        circularProgressAnimation.toValue = value
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
}

#Preview {
    let containerView = UIView()
    let progressBar = ProgressBarView()
    
    containerView.addSubview(progressBar)
    
    progressBar.snp.makeConstraints { make in
        make.center.equalToSuperview()
    }
    
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
        progressBar.setProgressWithAnimation(duration: 1.5, value: 1.0)
    }
    
    return containerView
}
