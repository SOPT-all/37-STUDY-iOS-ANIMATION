//
//  SegmentedControlViewController.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 12/1/25.
//

import UIKit

import Then
import SnapKit

final class SegmentedControlViewController: BaseUIViewController {
    private let segmentControl = UISegmentedControl(items: ["첫번째", "두번째", "세번째"])
    
    private let label1 = UILabel().then {
        $0.text = "첫번째입니다"
        $0.font = .systemFont(ofSize: 30)
        $0.textColor = .label
    }
    
    private let label2 = UILabel().then {
        $0.text = "두번째입니다"
        $0.font = .systemFont(ofSize: 30)
        $0.textColor = .label
    }
    
    private let label3 = UILabel().then {
        $0.text = "세번째입니다"
        $0.font = .systemFont(ofSize: 30)
        $0.textColor = .label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        segmentControl.selectedSegmentIndex = 0
        self.didChangeValue(segment: self.segmentControl)
    }
    
    override func setUI() {
        view.addSubviews(segmentControl, label1, label2, label3)
    }
    
    override func setLayout() {
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(32)
        }

        [label1, label2, label3].forEach { label in
            label.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.top.equalTo(segmentControl.snp.bottom).offset(180)
            }
        }
    }
    
    override func addTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
    }
}

extension SegmentedControlViewController {
    @objc private func didChangeValue(segment: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            label1.isHidden = false
            label2.isHidden = true
            label3.isHidden = true
        case 1:
            label1.isHidden = true
            label2.isHidden = false
            label3.isHidden = true
        case 2:
            label1.isHidden = true
            label2.isHidden = true
            label3.isHidden = false
        default:
            break
        }
    }
}
