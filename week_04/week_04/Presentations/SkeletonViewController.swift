//
//  SkeletonViewController.swift
//  week_04
//
//  Created by 조영서 on 12/9/25.
//

import UIKit

import SnapKit
import Then

class SkeletonViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let loadingLabel = UILabel().then {
        $0.text = "Ｌｏａｄｉｎｇ ..."
        $0.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        $0.textColor = .label
        $0.textAlignment = .center
    }
    
    private let gonyaniImageView = UIImageView().then {
        $0.image = .imgGonyani3
        $0.tintColor = .gray
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUI()
        setLayout()
    }
    
    // MARK: - Setup Methods
    
    func setUI() {
        view.addSubviews(loadingLabel, gonyaniImageView)
    }
    
    func setLayout() {
        
        loadingLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        gonyaniImageView.snp.makeConstraints {
            $0.top.equalTo(loadingLabel.snp.bottom).offset(15)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(200)
        }
    }
}
