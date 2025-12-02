//
//  SkeletonView.swift
//  AnimationStudy
//
//  Created by 신혜연 on 12/2/25.
//

import UIKit
import SnapKit

class SkeletonViewController: UIViewController {
    
    private let mengguImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
        skeletonAnimate()
    }
    
    private func setLayout() {
        view.addSubview(mengguImageView)
        
        mengguImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(400)
            $0.height.equalTo(300)
        }
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        mengguImageView.image = nil
        mengguImageView.backgroundColor = .systemPink
    }
    
    private func skeletonAnimate() {
        UIView.animateKeyframes(withDuration: 4.0, delay: 0, options: []) {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5) {
                self.mengguImageView.alpha = 0.4
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
                self.mengguImageView.alpha = 1.0
            }
            
        } completion: { _ in
            self.bind()
        }
    }
    
    private func bind() {
        self.mengguImageView.backgroundColor = .clear
        self.mengguImageView.image = UIImage(resource: .menggu2)
    }
}

#Preview {
    SkeletonViewController()
}
