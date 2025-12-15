import UIKit

final class ProgressBarView: UIView {
    
    // MARK: - Properties
    
    private var circleLayer = CAShapeLayer()
    private var progressLayer = CAShapeLayer()
    
    
    private var startPoint = CGFloat(3 * Double.pi / 4)
    
    private var endPoint = CGFloat(Double.pi / 4)
    
    // MARK: - Drawing
    
    override func draw(_ rect: CGRect) {
        createCircularPath()
    }
    
    // MARK: - Private Methods
    
    
    private func createCircularPath() {
        self.backgroundColor = .white
        
    
        let path = UIBezierPath(
            arcCenter: CGPoint(x: self.frame.width / 2,
                               y: self.frame.height / 2),
            radius: (frame.size.height - 10) / 2,
            startAngle: startPoint,
            endAngle: endPoint,
            clockwise: true
        )
        
    
        circleLayer.path = path.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        circleLayer.lineCap = .round
        circleLayer.lineWidth = 10
        circleLayer.strokeEnd = 1
        circleLayer.strokeColor = UIColor.black.withAlphaComponent(0.4).cgColor
        layer.addSublayer(circleLayer)
        
    
        progressLayer.path = path.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 10
        progressLayer.strokeEnd = 0
        progressLayer.strokeColor = UIColor.systemRed.cgColor
        layer.addSublayer(progressLayer)
    }
    
    // MARK: - Public Methods
    
  
    func progressAnimation(duration: TimeInterval, value: Double) {
  
        let circularProgressAnimation = CABasicAnimation(keyPath: "strokeEnd")
        circularProgressAnimation.duration = duration
        
  
        circularProgressAnimation.toValue = value
        
  
        circularProgressAnimation.fillMode = .forwards
        circularProgressAnimation.isRemovedOnCompletion = false
        
        progressLayer.add(circularProgressAnimation, forKey: "progressAnim")
    }
    
  
    func resetProgress() {
        progressLayer.removeAnimation(forKey: "progressAnim")
        progressLayer.strokeEnd = 0
    }
}
