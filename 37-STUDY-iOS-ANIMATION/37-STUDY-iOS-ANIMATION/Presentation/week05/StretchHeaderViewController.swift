//
//  StretchHeaderViewController.swift
//  37-STUDY-iOS-ANIMATION
//
//  Created by 김나연 on 12/15/25.
//

import UIKit

import SnapKit
import Then

final class StretchHeaderViewController: BaseUIViewController {
    private let imageView = UIImageView().then {
        $0.image = .mushroom
        $0.contentMode = .scaleAspectFill
    }
    
    private let label1 = UILabel().then {
        $0.text = "이제"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .cyan
    }
    
    private let label2 = UILabel().then {
        $0.text = "늘어나보겠습니다잉"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .cyan
    }
    
    private let label3 = UILabel().then {
        $0.text = "쭈욱~~"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.textColor = .cyan
    }
}
