//
//  ProgressBarContentView.swift
//  AnimationStudy
//
//  Created by 신혜연 on 12/2/25.
//

import UIKit
import SnapKit

class ProgressBarContentView: UIViewController {
    
    private let progressBar = ProgressBarView()
    
    private let gemImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.image = UIImage(resource: .boseuk)
        iv.alpha = 0
        return iv
    }()
    
    private let proposalLabel: UILabel = {
        let label = UILabel()
        label.text = "사랑? 웃기지 마.\n이젠 돈으로 사겠어.\n돈으로 사면될 거 아니야.\n얼마면 될까. 얼마면 되겠냐?\n🤑🤑🤑"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 5
        label.alpha = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        setUI()
        setLayout()
        triggerAnimation()
    }
    
    private func setUI() {
        view.addSubviews(progressBar, gemImageView, proposalLabel)
    }

    private func setLayout() {
        proposalLabel.snp.makeConstraints {
            $0.centerX.equalTo(progressBar)
            $0.top.equalToSuperview().offset(180)
        }
        
        gemImageView.snp.makeConstraints {
            $0.top.equalTo(proposalLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(100)
        }
        
        progressBar.snp.makeConstraints {
            $0.top.equalTo(gemImageView.snp.bottom).inset(24)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func triggerAnimation() {
        let duration: TimeInterval = 1.5
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.progressBar.setProgressWithAnimation(duration: duration, value: 1.0)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                self.showProposalContent()
            }
        }
    }
    
    private func showProposalContent() {
        self.gemImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.proposalLabel.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        UIView.animate(withDuration: 0.6,
                       delay: 0,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 1.0,
                       options: .curveEaseOut) {
            
            self.gemImageView.alpha = 1.0
            self.proposalLabel.alpha = 1.0
            
            self.gemImageView.transform = .identity
            self.proposalLabel.transform = .identity
        }
    }
}
