//
//  GestureViewController.swift
//  AnimationStudy
//
//  Created by 신혜연 on 11/4/25.
//

import UIKit

import SnapKit
import Then

class GestureViewController: UIViewController {
    
    // MARK: - UI Components
    
    private let characterImageView = UIImageView().then {
        $0.image = UIImage(resource: .mandu)
        $0.contentMode = .scaleAspectFit
        $0.isUserInteractionEnabled = true
    }
    
    private let BubbleImageView = UIImageView().then {
        $0.image = UIImage(resource: .myStyle)
        $0.contentMode = .scaleAspectFit
        $0.alpha = 0
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        setGestureRecognizers()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        view.addSubviews(characterImageView, BubbleImageView)
    }
    
    private func setLayout() {
        characterImageView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.size.equalTo(200)
        }
        
        BubbleImageView.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(60)
            $0.bottom.equalTo(characterImageView.snp.top)
            $0.width.equalTo(180)
            $0.height.equalTo(100)
        }
    }
    
    private func setGestureRecognizers() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        characterImageView.addGestureRecognizer(tapGesture)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        characterImageView.addGestureRecognizer(panGesture)
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        // 살짝 커지는 말풍선
        UIView.animate(withDuration: 0.3, animations: {
            self.BubbleImageView.alpha = 1.0
            self.BubbleImageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            // 원래 크기로 작아짐
            UIView.animate(withDuration: 0.3, delay: 0.5, options: [], animations: {
                self.BubbleImageView.alpha = 0
                self.BubbleImageView.transform = .identity
            }, completion: nil)
        }
    }
    
    @objc private func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self.view)
        
        switch gesture.state {
        case .began, .changed:
            self.characterImageView.center = CGPoint(
                x: self.characterImageView.center.x + translation.x,
                y: self.characterImageView.center.y + translation.y
            )
            self.BubbleImageView.center = CGPoint(
                x: self.BubbleImageView.center.x + translation.x,
                y: self.BubbleImageView.center.y + translation.y
            )
            
            gesture.setTranslation(.zero, in: self.view) // 다시 초기화
            
        case .ended:
            let finalCharacterCenter = self.characterImageView.center
            let finalBubbleCenter = self.BubbleImageView.center
            
            let offsetX = finalBubbleCenter.x - finalCharacterCenter.x
            let offsetY = finalBubbleCenter.y - finalCharacterCenter.y
            
            self.characterImageView.snp.remakeConstraints {
                $0.center.equalTo(finalCharacterCenter)
                $0.size.equalTo(200)
            }
            
            self.BubbleImageView.snp.remakeConstraints { $0.centerX.equalTo(self.characterImageView.snp.centerX).offset(offsetX)
                $0.centerY.equalTo(self.characterImageView.snp.centerY).offset(offsetY)
                $0.width.equalTo(180)
                $0.height.equalTo(120)
            }
            
        default:
            break
        }
    }
}

#Preview {
    GestureViewController()
}
