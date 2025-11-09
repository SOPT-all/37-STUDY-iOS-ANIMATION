//
//  SegmentedControl.swift
//  37-iOS-animation
//
//  Created by 이나연 on 11/10/25.
//

import UIKit

import SnapKit
import Then

final class SegmentedControl: UIViewController {
    private let segmentControl = UISegmentedControl()
    private let imageArray : [UIImage] = [.ganadi, .ganadi2, .ganadi3]
    private let ganadi1View = UIImageView(image: UIImage(named: "ganadi"))
    private let ganadi2View = UIImageView(image: UIImage(named: "ganadi2"))
    private let ganadi3View = UIImageView(image: UIImage(named: "ganadi3"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setStyle()
        self.didChangeValue(segment: self.segmentControl)
        setAddTarget()
    }
    
    private func setUI() {
        self.view.backgroundColor = .white
        self.view.addSubviews(segmentControl, ganadi1View, ganadi2View, ganadi3View)
    }
    
    private func setLayout() {
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(240)
            $0.height.equalTo(32)
        }
        
        [ganadi1View, ganadi2View, ganadi3View].forEach {
            $0.snp.makeConstraints {
                $0.top.equalTo(segmentControl.snp.bottom).offset(24)
                $0.centerX.equalToSuperview()
                $0.width.height.equalTo(200)
            }
        }
    }
    
    private func setStyle() {
        segmentControl.removeAllSegments()
        
        imageArray.enumerated().forEach { index, image in
            segmentControl.insertSegment(with: image, at: index, animated: false)
        }
        
        segmentControl.do {
            $0.selectedSegmentIndex = 0
            $0.setTitle("가나디", forSegmentAt: 0)
            $0.setTitle("가나디2", forSegmentAt: 1)
            $0.setTitle("가나디3", forSegmentAt: 2)
        }
        
        ganadi1View.do {
            $0.image = .ganadi
            $0.contentMode = .scaleAspectFill
        }
        
        ganadi2View.do {
            $0.image = .ganadi2
            $0.contentMode = .scaleAspectFill
        }
        
        ganadi3View.do {
            $0.image = .ganadi3
            $0.contentMode = .scaleAspectFill
        }
    }
    
    private func setAddTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
    }
    
    @objc
    private func didChangeValue(segment: UISegmentedControl) {
        let index = segment.selectedSegmentIndex
        ganadi1View.isHidden = index != 0
        ganadi2View.isHidden = index != 1
        ganadi3View.isHidden = index != 2
    }
}
