//
//  CarouselViewController.swift
//  Animation
//
//  Created by 진소은 on 12/1/25.
//

import UIKit

import SnapKit
import Then

final class CarouselViewController: UIViewController {
    private let images: [UIImage] = [
        .imgDamgom1, .imgDamgom2, .imgDamgom3, .imgDamgom4, .imgDamgom5
    ]

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 0
            $0.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        }

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout).then {
            $0.isPagingEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.delegate = self
            $0.dataSource = self
            $0.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        }
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.setContentOffset(.init(x: view.frame.width, y: 0), animated: false)
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)
        self.navigationController?.isNavigationBarHidden = true
        collectionView.snp.makeConstraints { $0.edges.equalToSuperview()
        }
    }
}

extension CarouselViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count + 2
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)

        let realIndex: Int
        if indexPath.item == 0 {
            realIndex = images.count - 1
        } else if indexPath.item == images.count + 1 {
            realIndex = 0
        } else {
            realIndex = indexPath.item - 1
        }

        let imageView = UIImageView(image: images[realIndex])
        imageView.contentMode = .scaleAspectFit
        cell.backgroundView = imageView

        return cell
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let index = scrollView.contentOffset.x / width

        if index == 0 {
            scrollView.setContentOffset(.init(x: width * CGFloat(images.count), y: 0), animated: false)
        } else if index == CGFloat(images.count + 1) {
            scrollView.setContentOffset(.init(x: width, y: 0), animated: false)
        }
    }
}
