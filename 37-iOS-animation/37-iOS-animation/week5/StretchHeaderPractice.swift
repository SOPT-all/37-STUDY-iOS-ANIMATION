//
//  StretchHeaderPractice.swift
//  37-iOS-animation
//
//  Created by 이나연 on 12/15/25.
//

import UIKit

import SnapKit
import Then

final class StretchHeaderPractice: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let imageView = UIImageView()
    private let imageContainerView = UIView()
    private let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setUI()
        setLayout()
        setStyle()
    }
    
    private func setUI() {
        self.view.addSubviews(scrollView, imageView)
        scrollView.addSubviews(contentView)
        contentView.addSubviews(imageContainerView, label)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(self.view.frame.width)
            $0.height.equalTo(1000)
        }
        
        imageContainerView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            $0.height.equalTo(450)
        }
        
        imageView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.equalTo(imageContainerView)
        }
        
        label.snp.makeConstraints {
            $0.top.equalTo(imageContainerView.snp.bottom).offset(100)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setStyle() {
        scrollView.do {
            $0.contentInsetAdjustmentBehavior = .never
        }
        
        imageView.do {
            $0.image = .ganadi5
            $0.contentMode = .scaleAspectFill
        }
        
        label.do {
            $0.text = "늘어나여.."
        }
    }
}
