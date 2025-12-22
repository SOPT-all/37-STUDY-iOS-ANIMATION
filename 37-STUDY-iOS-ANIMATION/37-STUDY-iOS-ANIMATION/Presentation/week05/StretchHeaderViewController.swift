//
//  StretchHeaderViewController.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 12/15/25.
//

import UIKit

import SnapKit
import Then

final class StretchHeaderViewController: BaseUIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let imageContainerView = UIView()
    
    private let imageView = UIImageView().then {
        $0.image = .mushroom
        $0.contentMode = .scaleAspectFill
    }
    
    private let label1 = UILabel().then {
        $0.text = "이제"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .cyan
    }
    
    private let label2 = UILabel().then {
        $0.text = "늘어나보겠습니다잉"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .cyan
    }
    
    private let label3 = UILabel().then {
        $0.text = "쭈욱~~"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .cyan
    }
    
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 15
    }
    
    override func setUI() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews(imageContainerView, stackView)
        imageContainerView.addSubview(imageView)
        stackView.addArrangedSubviews(label1, label2, label3)
    }
    
    override func setLayout() {
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
            
        stackView.snp.makeConstraints {
            $0.top.equalTo(imageContainerView.snp.bottom).offset(50)
            $0.centerX.equalToSuperview()
        }
    }
}
