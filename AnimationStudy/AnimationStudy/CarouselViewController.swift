//
//  CarouselView.swift
//  AnimationStudy
//
//  Created by 신혜연 on 11/16/25.
//

import UIKit
import SnapKit
import Then

final class CarouselViewController: UIViewController {
    
    private let imageArray: [UIImage] = [
        .carousel1, .carousel2, .carousel3, .carousel4
    ]
    
    private lazy var carouselImages: [UIImage] = {
        var arr = imageArray
        arr.insert(imageArray.last!, at: 0)
        arr.append(imageArray.first!)
        return arr
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 300, height: 300)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        return UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.isPagingEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
            $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: collectionView.frame.width,
                                     height: collectionView.frame.height)
        }

        let width = collectionView.frame.width
        collectionView.setContentOffset(.init(x: width, y: 0), animated: false)
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension CarouselViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        carouselImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "cell",
            for: indexPath
        )
        
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        
        let imageView = UIImageView(image: carouselImages[indexPath.item])
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        cell.contentView.addSubview(imageView)
        imageView.snp.makeConstraints { $0.edges.equalToSuperview() }
        
        return cell
    }
}

extension CarouselViewController: UICollectionViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let page = Int(scrollView.contentOffset.x / width)

        // 0번 인덱스에는 마지막 사진이 와야함
        if page == 0 {
            scrollView.setContentOffset(
                CGPoint(x: width * CGFloat(carouselImages.count - 2), y: 0),
                animated: false
            )
        }

        // 마지막에는 첫 번째 인덱스로 설정
        else if page == carouselImages.count - 1 {
            scrollView.setContentOffset(
                CGPoint(x: width, y: 0),
                animated: false
            )
        }
    }

}
