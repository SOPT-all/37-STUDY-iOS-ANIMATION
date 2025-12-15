import UIKit
import SnapKit
import Then

final class ProgressBarViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let fullCircleView = FullCircleProgressView()
    private let semiCircleView = SemiCircleProgressView()
    private let linearView = LinearProgressView()          
    
    private let label1 = UILabel()
    private let label2 = UILabel()
    private let label3 = UILabel()
    
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
        title = "Progress Bar"
        
        label1.do {
            $0.text = "완전한 원"
            $0.font = .systemFont(ofSize: 14)
            $0.textAlignment = .center
        }
        
        label2.do {
            $0.text = "반원"
            $0.font = .systemFont(ofSize: 14)
            $0.textAlignment = .center
        }
        
        label3.do {
            $0.text = "직선 바"
            $0.font = .systemFont(ofSize: 14)
            $0.textAlignment = .center
        }
        
        startButton.do {
            $0.setTitle("Start All", for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            $0.backgroundColor = .systemBlue
            $0.setTitleColor(.white, for: .normal)
            $0.layer.cornerRadius = 12
        }
    }
    
    private func setHierarchy() {
        [fullCircleView, semiCircleView, linearView,
         label1, label2, label3, startButton].forEach {
            view.addSubview($0)
        }
    }
    
    private func setLayout() {
        fullCircleView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(120)
        }
        
        label1.snp.makeConstraints {
            $0.top.equalTo(fullCircleView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        semiCircleView.snp.makeConstraints {
            $0.top.equalTo(label1.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(120)
        }
        
        label2.snp.makeConstraints {
            $0.top.equalTo(semiCircleView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        linearView.snp.makeConstraints {
            $0.top.equalTo(label2.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(40)
            $0.height.equalTo(30)
        }
        
        label3.snp.makeConstraints {
            $0.top.equalTo(linearView.snp.bottom).offset(8)
            $0.centerX.equalToSuperview()
        }
        
        startButton.snp.makeConstraints {
            $0.top.equalTo(label3.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        }
    }
    
    private func setTarget() {
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func startButtonTapped() {
        fullCircleView.progressAnimation(duration: 2.0, value: 0.75)
        semiCircleView.progressAnimation(duration: 2.0, value: 0.75)
        linearView.progressAnimation(duration: 2.0, value: 0.75)
    }
}

#Preview {
    ProgressBarViewController()
}
