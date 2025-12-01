//
//  InfinityCarouselViewController.swift
//  week_03
//

import UIKit
import SnapKit
import Then

final class InfinityCarouselViewController: UIViewController {
    
    // MARK: - Properties
    
    private let images: [UIImage?] = [
        UIImage(named: "tamama6"),
        UIImage(named: "tamama1"),
        UIImage(named: "tamama2"),
        UIImage(named: "tamama3"),
        UIImage(named: "tamama4"),
        UIImage(named: "tamama5"),
        UIImage(named: "tamama6"),
        UIImage(named: "tamama1")
    ]
    
    private let realCount = 6
    
    // MARK: - UI
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 0
            $0.itemSize = CGSize(width: 250, height: 250)
        }
    ).then {
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        $0.delegate = self
        $0.dataSource = self
    }
    
    private let pageControl = UIPageControl().then {
        $0.numberOfPages = 6
        $0.currentPage = 0
        $0.pageIndicatorTintColor = .lightGray
        $0.currentPageIndicatorTintColor = .black
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        setUI()
        setLayout()
        moveToStart()
    }
    
    // MARK: - Setup
    
    private func setUI() {
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.identifier)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(250)
        }
        
        pageControl.snp.makeConstraints {
            $0.top.equalTo(collectionView.snp.bottom).offset(12)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func moveToStart() {
        DispatchQueue.main.async {
            self.collectionView.scrollToItem(
                at: IndexPath(item: 1, section: 0),
                at: .centeredHorizontally,
                animated: false
            )
        }
    }
}

// MARK: - UICollectionViewDataSource

extension InfinityCarouselViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        images.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CarouselCell.identifier,
            for: indexPath
        ) as! CarouselCell
        
        cell.configure(with: images[indexPath.item] ?? UIImage())
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension InfinityCarouselViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.width
        let page = Int(scrollView.contentOffset.x / width)
        
        let realIndex = (page - 1 + realCount) % realCount
        pageControl.currentPage = realIndex
        
        if page == 0 {
            scrollView.setContentOffset(.init(x: width * 6, y: 0), animated: false)
        } else if page == 7 {
            scrollView.setContentOffset(.init(x: width * 1, y: 0), animated: false)
        }
    }
}
