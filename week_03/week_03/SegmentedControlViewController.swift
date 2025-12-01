//
//  SegmentedControlViewController.swift
//  week_03
//
//  Created by 조영서 on 11/30/25.
//

import UIKit

import SnapKit
import Then

final class SegmentedControlViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let segmentControl = UISegmentedControl().then {
        $0.selectedSegmentIndex = 0
    }
    
    private let tamama1View = UIImageView().then {
        $0.image = UIImage(named: "tamama1")
        $0.contentMode = .scaleAspectFit
    }
    private let tamama2View = UIImageView().then {
        $0.image = UIImage(named: "tamama2")
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    private let tamama3View = UIImageView().then {
        $0.image = UIImage(named: "tamama3")
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    private let tamama4View = UIImageView().then {
        $0.image = UIImage(named: "tamama4")
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    private let tamama5View = UIImageView().then {
        $0.image = UIImage(named: "tamama5")
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    private let tamama6View = UIImageView().then {
        $0.image = UIImage(named: "tamama6")
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setSegmentItems()
        setUI()
        setLayout()
        setAddTarget()
        
        didChangeValue(segment: segmentControl)
    }
    
    // MARK: - Setup Methods
    
    private func setSegmentItems() {
        segmentControl.insertSegment(withTitle: "★", at: 0, animated: false)
        segmentControl.insertSegment(withTitle: "☆", at: 1, animated: false)
        segmentControl.insertSegment(withTitle: "★", at: 2, animated: false)
        segmentControl.insertSegment(withTitle: "☆", at: 3, animated: false)
        segmentControl.insertSegment(withTitle: "★", at: 4, animated: false)
        segmentControl.insertSegment(withTitle: "☆", at: 5, animated: false)
    }
    
    private func setUI() {
        view.addSubview(segmentControl)
        view.addSubview(tamama1View)
        view.addSubview(tamama2View)
        view.addSubview(tamama3View)
        view.addSubview(tamama4View)
        view.addSubview(tamama5View)
        view.addSubview(tamama6View)
    }

    private func setLayout() {
        segmentControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        let imageViews = [
            tamama1View, tamama2View, tamama3View,
            tamama4View, tamama5View, tamama6View
        ]
        
        imageViews.forEach { view in
            view.snp.makeConstraints {
                $0.top.equalTo(segmentControl.snp.bottom).offset(80)
                $0.centerX.equalToSuperview()
                $0.size.equalTo(250)
            }
        }
    }

    private func setAddTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
    }

    // MARK: - Actions
    
    @objc
    private func didChangeValue(segment: UISegmentedControl) {
        let index = segment.selectedSegmentIndex
        
        tamama1View.isHidden = index != 0
        tamama2View.isHidden = index != 1
        tamama3View.isHidden = index != 2
        tamama4View.isHidden = index != 3
        tamama5View.isHidden = index != 4
        tamama6View.isHidden = index != 5
    }
}
