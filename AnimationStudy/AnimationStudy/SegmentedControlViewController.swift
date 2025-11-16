//
//  SegmentedControlViewController.swift
//  AnimationStudy
//
//  Created by 신혜연 on 11/16/25.
//

import UIKit

import SnapKit
import Then

final class SegmentedControlViewController: UIViewController {
    
    private let segmentControl = UISegmentedControl(items: ["안뇽 얘두라", "월요병에는", "피자묵자"])
    private let view1 = UIImageView(image: UIImage(resource: .carousel1))
    private let view2 = UIImageView(image: UIImage(resource: .carousel2))
    private let view3 = UIImageView(image: UIImage(resource: .carousel3))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        setAddTarget()
        segmentControl.selectedSegmentIndex = 0
        self.didChangeValue(segment: self.segmentControl)
    }
    
    private func setUI() {
        view.backgroundColor = .white
        
        [view1, view2, view3].forEach {
            $0.contentMode = .scaleAspectFit
            $0.isHidden = true
            view.addSubview($0)
        }
        
        view.addSubview(segmentControl)
    }
    
    private func setLayout() {
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
        }
        
        [view1, view2, view3].forEach { imageView in
            imageView.snp.makeConstraints {
                $0.top.equalTo(segmentControl.snp.bottom).offset(20)
                $0.leading.trailing.bottom.equalToSuperview()
            }
        }
    }
    
    private func setAddTarget() {
        segmentControl.addTarget(
            self,
            action: #selector(didChangeValue(segment:)),
            for: .valueChanged
        )
    }

    @objc
    private func didChangeValue(segment: UISegmentedControl) {
        let index = segment.selectedSegmentIndex
        view1.isHidden = index != 0
        view2.isHidden = index != 1
        view3.isHidden = index != 2
    }
}
