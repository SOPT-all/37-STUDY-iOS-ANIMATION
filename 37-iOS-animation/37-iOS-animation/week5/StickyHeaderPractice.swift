//
//  StickyHeaderPractice.swift
//  37-iOS-animation
//
//  Created by 이나연 on 12/15/25.
//

import UIKit

import SnapKit
import Then

final class StickyHeaderPractice: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let firstLabel = UILabel()
    private let header = UIView()
    private let stickyHeader = UIView()
    private let secondLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        scrollView.delegate = self
        
        setUI()
        setLayout()
        setStyle()
    }
    
    private func setUI() {
        self.view.addSubviews(scrollView, stickyHeader)
        scrollView.addSubview(contentView)
        contentView.addSubviews(firstLabel, header,  secondLabel)
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.left.right.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalTo(0)
            $0.width.equalTo(self.view.frame.width)
            $0.height.equalTo(2000)
        }
        
        stickyHeader.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        firstLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.centerX.equalToSuperview()
        }
        
        header.snp.makeConstraints {
            $0.top.equalTo(firstLabel.snp.bottom).offset(400)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        secondLabel.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom).offset(400)
            $0.bottom.equalToSuperview().inset(40)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func setStyle() {
        firstLabel.do {
            $0.text = "스티키헤더를 찾아서~~~~"
        }
        
        header.do {
            $0.backgroundColor = .systemBlue
        }
        
        stickyHeader.do {
            $0.backgroundColor = .systemRed
            $0.isHidden = true
        }
        
        secondLabel.do {
            $0.text = "안녕하세여..제가보이시나요?,,"
        }
    }
}

extension StickyHeaderPractice: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(self.scrollView.contentOffset.y, self.header.frame.minY)
        
        let shouldShowSticky = self.scrollView.contentOffset.y > self.header.frame.minY
        print(shouldShowSticky)
        self.stickyHeader.isHidden = !shouldShowSticky
    }
}

