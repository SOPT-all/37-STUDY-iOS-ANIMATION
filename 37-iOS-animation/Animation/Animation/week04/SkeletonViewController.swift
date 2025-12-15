//
//  SkeletonViewController.swift
//  Animation
//
//  Created by 진소은 on 12/15/25.
//

import UIKit

import SkeletonView
import SnapKit
import Then

final class SkeletonViewController: UIViewController {
    private let label = UILabel()
    private let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.isSkeletonable = true
        setUI()
        setLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.view.showSkeleton()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
          self.view.hideSkeleton()
        }
    }
    
    private func setUI() {
        label.do {
            $0.text = "듀 !"
            $0.textAlignment = .center
            $0.isSkeletonable = true
        }
        imageView.do {
            $0.image = UIImage(resource: .imgDamgom1)
            $0.isSkeletonable = true
        }
    }
    
    private func setLayout() {
        view.addSubviews(label, imageView)
        
        label.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-100)
            $0.horizontalEdges.equalToSuperview().inset(100)
        }
        
        imageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(label.snp.bottom).offset(50)
            $0.size.equalTo(200)
        }
    }
}
