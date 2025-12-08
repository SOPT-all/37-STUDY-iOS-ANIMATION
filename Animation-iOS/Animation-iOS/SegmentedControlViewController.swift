import UIKit
import SnapKit

class SegmentedControlViewController: UIViewController {
    
    private let segmentControl = UISegmentedControl(items: ["Kirby 1", "Kirby 2", "Kirby 3"])
    private let kirby1View = UIImageView(image: UIImage(named: "kirby1"))
    private let kirby2View = UIImageView(image: UIImage(named: "kirby2"))
    private let kirby3View = UIImageView(image: UIImage(named: "kirby3"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setSegmentControl()
        setHierarchy()
        setLayout()
        AddTarget()
        
        self.didChangeValue(segment: self.segmentControl)
    }
    
    private func setSegmentControl() {
        segmentControl.selectedSegmentIndex = 0
    }
    
    private func setHierarchy() {
        view.addSubview(segmentControl)
        view.addSubview(kirby1View)
        view.addSubview(kirby2View)
        view.addSubview(kirby3View)
    }
    
    private func setLayout() {
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(40)
        }
        
        kirby1View.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(250)
        }
        
        kirby2View.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(250)
        }
        
        kirby3View.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(250)
        }
        
        [kirby1View, kirby2View, kirby3View].forEach {
            $0.contentMode = .scaleAspectFit
        }
    }
    
    private func AddTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
    }
    
    @objc
    private func didChangeValue(segment: UISegmentedControl) {
        let index = segment.selectedSegmentIndex
        kirby1View.isHidden = index != 0
        kirby2View.isHidden = index != 1
        kirby3View.isHidden = index != 2
    }
}

#Preview {
    SegmentedControlViewController()
}
