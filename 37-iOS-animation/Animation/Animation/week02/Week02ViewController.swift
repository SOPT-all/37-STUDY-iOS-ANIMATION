//
//  Week02ViewController.swift
//  Animation
//
//  Created by 진소은 on 11/10/25.
//

import UIKit

import SnapKit
import Then

final class Week02ViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let damgomView = UIView()
    
    private let imageView = UIImageView().then {
        $0.image = UIImage(named: "img_damgom")
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    private let imageView2 = UIImageView().then {
        $0.image = UIImage(named: "img_damgom")
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    
    private let imageView3 = UIImageView().then {
        $0.image = UIImage(named: "img_damgom")
        $0.contentMode = .scaleAspectFit
        $0.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setAddTarget()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(damgomView)
        damgomView.addSubviews(imageView, imageView2,imageView3)
        
        damgomView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.height.equalTo(150)
        }
        
        imageView2.snp.makeConstraints {
            $0.trailing.equalTo(imageView.snp.leading)
            $0.centerY.equalTo(imageView.snp.top)
            $0.width.height.equalTo(100)
        }
        
        imageView3.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing)
            $0.centerY.equalTo(imageView.snp.top)
            $0.width.height.equalTo(100)
        }
    }
    
    private func setAddTarget() {
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(damgomDidTap)))
        imageView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(ganadiDidTap)))
    }
    
    @objc
    private func damgomDidTap(_ sender: UITapGestureRecognizer) {
        imageView2.isHidden.toggle()
        imageView3.isHidden.toggle()
    }
    
    @objc
    private func ganadiDidTap(_ sender: UIPanGestureRecognizer) {
        let transition = sender.translation(in: self.damgomView)
        let changedX = damgomView.center.x + transition.x
        let changedY = damgomView.center.y + transition.y
        
        self.damgomView.center = .init(x: changedX, y: changedY)
        sender.setTranslation(.zero, in: self.damgomView)
    }
}
