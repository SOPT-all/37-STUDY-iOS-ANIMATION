//
//  ToastView.swift
//  AnimationStudy
//
//  Created by 신혜연 on 11/3/25.
//

import UIKit

import SnapKit
import Then

class ToastView: UIView {
    
    private let titleLabel = UILabel().then {
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.textAlignment = .center
        $0.numberOfLines = 0
    }
    
    init(title: String) {
        super.init(frame: .zero)
        
        self.titleLabel.text = title
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        self.backgroundColor = .black.withAlphaComponent(0.7)
        self.layer.cornerRadius = 8
        self.addSubview(titleLabel)
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.bottom.equalToSuperview().inset(12)
        }
    }
}
