//
//  ToastView.swift
//  37-iOS-animation
//
//  Created by 이나연 on 10/25/25.
//

import UIKit

import SnapKit
import Then

final class ToastView: UIView {
    
    private let titleLabel = UILabel()
    
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setLayout() {
        self.backgroundColor = .gray
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(15)
        }
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.textColor = .white
            $0.textAlignment = .center
        }
    }
}
