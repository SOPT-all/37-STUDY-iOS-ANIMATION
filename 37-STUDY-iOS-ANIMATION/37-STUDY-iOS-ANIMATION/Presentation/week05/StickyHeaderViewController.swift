//
//  StickyHeaderViewController.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 12/22/25.
//

import UIKit

import SnapKit
import Then

final class StickyHeaderViewController: BaseUIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let header = UIView().then {
        $0.backgroundColor = .systemRed
    }
    
    private let stickyHeader = UIView().then {
        $0.backgroundColor = .systemBlue
    }
    
    private let dummy = UIView()

    override func setUI() {
        view.addSubviews(scrollView,  stickyHeader)
        scrollView.addSubview(contentView)
        contentView.addSubviews(header, dummy)

        stickyHeader.isHidden = true
    }

    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }

        header.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(120)
        }
        
        dummy.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(2000)
        }
        
        stickyHeader.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(56)
        }
    }
    
    override func setDelegate() {
        scrollView.delegate = self
    }
}

extension StickyHeaderViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let offsetY = scrollView.contentOffset.y
        let triggerY = header.frame.maxY
        let shouldShowSticky = offsetY > triggerY

        stickyHeader.isHidden = !shouldShowSticky
    }
}
