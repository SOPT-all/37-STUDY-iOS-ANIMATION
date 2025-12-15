import UIKit

// MARK: - 1. 완전한 원 (360도)
final class FullCircleProgressView: UIView {
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        createCircularPath()
    }
    
    private func createCircularPath() {
        backgroundColor = .white
        
        let path = UIBezierPath(
            arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2),
            radius: (frame.size.height - 10) / 2,
            startAngle: -(.pi / 2),  // 12시 방향에서 시작
            endAngle: .pi * 1.5,     // 한 바퀴 돌아서 12시 방향으로
            clockwise: true
        )
        
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 10
        circleLayer.strokeColor = UIColor.black.withAlphaComponent(0.2).cgColor
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
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.toValue = value
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "progressAnim")
    }
}

// MARK: - 2. 반원 (위쪽)
final class SemiCircleProgressView: UIView {
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        createCircularPath()
    }
    
    private func createCircularPath() {
        backgroundColor = .white
        
        let path = UIBezierPath(
            arcCenter: CGPoint(x: frame.width / 2, y: frame.height / 2),
            radius: (frame.size.height - 10) / 2,
            startAngle: .pi,      // 9시 방향에서 시작
            endAngle: 0,          // 3시 방향에서 끝
            clockwise: true
        )
        
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 10
        circleLayer.strokeColor = UIColor.black.withAlphaComponent(0.2).cgColor
        layer.addSublayer(circleLayer)
        
        progressLayer.path = path.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.systemGreen.cgColor
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration: TimeInterval, value: Double) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.toValue = value
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "progressAnim")
    }
}

// MARK: - 3. 직선 바
final class LinearProgressView: UIView {
    
    private var backgroundLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    override func draw(_ rect: CGRect) {
        createLinearPath()
    }
    
    private func createLinearPath() {
        backgroundColor = .white
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: frame.height / 2))
        path.addLine(to: CGPoint(x: frame.width - 10, y: frame.height / 2))
        
        backgroundLayer.path = path.cgPath
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.lineCap = .round
        backgroundLayer.lineWidth = 10
        backgroundLayer.strokeColor = UIColor.black.withAlphaComponent(0.2).cgColor
        layer.addSublayer(backgroundLayer)
        
        progressLayer.path = path.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.systemOrange.cgColor
        layer.addSublayer(progressLayer)
    }
    
    func progressAnimation(duration: TimeInterval, value: Double) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.toValue = value
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        progressLayer.add(animation, forKey: "progressAnim")
    }
}
