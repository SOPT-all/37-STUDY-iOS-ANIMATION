//
//  InfinityCarouselViewCell.swift
//  37-iOS-animation
//
//  Created by 이나연 on 11/10/25.
//

import UIKit

import SnapKit
import Then

class InfinityCarouselViewCell: UICollectionViewCell {
    static let identifier: String = "InfinityCarouselViewCell"
    private let imageView = UIImageView()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUI()
        setLayout()
        setStyle()
    }
    
    private func setUI() {
        addSubviews(imageView)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func setStyle() {
        imageView.do {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
        }
    }
    
    func bind(image: UIImage) {
        imageView.image = image
    }
}
