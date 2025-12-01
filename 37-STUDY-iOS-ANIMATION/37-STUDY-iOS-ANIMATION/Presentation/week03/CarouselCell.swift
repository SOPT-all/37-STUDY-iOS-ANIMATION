//
//  CarouselCell.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 12/1/25.
//

import UIKit

import Then
import SnapKit

final class CarouselCell: UICollectionViewCell {
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        contentView.addSubview(imageView)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    func configure(image: UIImage) {
        imageView.image = image
    }
}
