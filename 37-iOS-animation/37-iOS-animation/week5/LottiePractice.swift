//
//  LottiePractice.swift
//  37-iOS-animation
//
//  Created by 이나연 on 12/14/25.
//

import UIKit

import SnapKit
import Then
import Lottie

final class LottiePractice: UIViewController {
    private let lottieView = LottieAnimationView(name: "bori_congrate")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(lottieView)
        
        lottieView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        lottieView.play()
        lottieView.loopMode = .loop
    }
}
