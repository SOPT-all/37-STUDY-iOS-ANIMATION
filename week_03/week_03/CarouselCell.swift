//
//  CarouselCell.swift
//  week_03
//
//  Created by 조영서 on 11/30/25.
//

import UIKit

import SnapKit
import Then

final class CarouselCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "CarouselCell"
    
    // MARK: - UI Components
    
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 125
    }
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Setup Methods
    
    private func setUI() {
        contentView.addSubview(imageView)
    }
    
    private func setLayout() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    
    // MARK: - Public Method
    
    func configure(with image: UIImage?) {
        imageView.image = image
    }
}
