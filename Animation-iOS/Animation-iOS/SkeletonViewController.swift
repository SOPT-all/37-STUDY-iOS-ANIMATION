import UIKit
import SnapKit
import Then

final class SkeletonViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let imageView = UIView()
    private let startButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setHierarchy()
        setLayout()
        setTarget()
    }
    
    // MARK: - Setup
    
    private func setStyle() {
        view.backgroundColor = .white
        title = "Skeleton Animation!!!!!"
        
        imageView.do {
            $0.backgroundColor = .gray
            $0.layer.cornerRadius = 8
        }
        
        startButton.do {
            $0.setTitle("시작작작", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            $0.backgroundColor = .systemBlue
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 12
        }
    }
    
    private func setHierarchy() {
        view.addSubview(imageView)
        view.addSubview(startButton)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(150)
        }
        
        startButton.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(60)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(120)
            $0.height.equalTo(50)
        }
    }
    
    private func setTarget() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func startButtonTapped() {
        skeletonAnimate()
    }
    
    // MARK: - Animation
    
    private func skeletonAnimate() {
        imageView.backgroundColor = .gray
        
        UIView.animateKeyframes(withDuration: 4, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.imageView.alpha = 0.4
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.imageView.alpha = 1
            }
        } completion: { _ in
            self.bind()
        }
    }
    
    private func bind() {
        imageView.backgroundColor = .systemPink
    }
}

#Preview {
    SkeletonViewController()
}
