//
//  InfinityCarouselView.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 12/1/25.
//

import UIKit

import Then
import SnapKit

final class InfinityCarouselView: BaseUIView {

    private var originalImages: [UIImage] = [
        .image1, .image2, .image3, .image4, .image5
    ]

    private var displayImages: [UIImage] {
        guard originalImages.count > 1 else { return originalImages }
        return [originalImages.last!] + originalImages + [originalImages.first!]
    }

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        cv.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.identifier)
        return cv
    }()

    override func setUI() {
        addSubview(collectionView)
    }

    override func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = bounds.size
        }
        if collectionView.contentOffset == .zero && displayImages.count > 1 {
            let initialIndex = 1
            collectionView.scrollToItem(at: IndexPath(item: initialIndex, section: 0), at: .centeredHorizontally, animated: false)
        }
    }
}

extension InfinityCarouselView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        displayImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CarouselCell.identifier, for: indexPath
        ) as! CarouselCell
        cell.configure(image: displayImages[indexPath.item])
        return cell
    }
}

extension InfinityCarouselView: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = collectionView.frame.width
        let page = Int(scrollView.contentOffset.x / pageWidth)
        let lastIndex = displayImages.count - 1
        let firstIndex = 1
        let lastRealDataIndex = originalImages.count
        if page == 0 {
            collectionView.scrollToItem(
                at: IndexPath(item: lastRealDataIndex, section: 0),
                at: .centeredHorizontally,
                animated: false
            )
        } else if page == lastIndex {
            collectionView.scrollToItem(
                at: IndexPath(item: firstIndex, section: 0),
                at: .centeredHorizontally,
                animated: false
            )
        }
    }
}
