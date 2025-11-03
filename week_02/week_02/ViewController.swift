//
//  ViewController.swift
//  week_02
//
//  Created by 조영서 on 11/3/25.
//

import UIKit
import SnapKit
import Then

final class ViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let gonyani = UIImageView(image: UIImage(named: "gonyani")).then {
        $0.contentMode = .scaleAspectFit
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setTarget()
        setLayout()
    }
    
    // MARK: - Setup Methods
    
    private func setTarget() {
    }
    
    private func setLayout() {
        view.addSubviews(gonyani)
        
        gonyani.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.centerX.equalToSuperview()
            $0.size.equalTo(100)
        }
    }
    
    // MARK: - Actions
    
    @objc private func resetDidTap() {
        UIView.animate(withDuration: 0.3) {
            self.gonyani.transform = .identity
        }
    }
}
