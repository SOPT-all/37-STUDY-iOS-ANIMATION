//
//  MainViewController.swift
//  Animation-iOS
//
//  Created by 송성용 on 11/3/25.
//
import UIKit
import SnapKit
import Toast



class MainViewController: UIViewController {
    
    
    private lazy var transFormButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("움직여!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(transformDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var rotateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("돌아!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(rotateDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var scaleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("커져라~!", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(scaleDidTap), for: .touchUpInside)

        return button
    }()
    
    private lazy var AmazingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("환상의 묘기!", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(amazingBtnDidTap), for: .touchUpInside)
        button.applyGradient(colors: [UIColor.blue, UIColor.purple])

        return button
    }()
    
    
    
   
    
    let kirby: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Kirby")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    
    @objc private func transformDidTap() {
        UIView.animate(withDuration: 1, delay: 0, options:[.beginFromCurrentState]) {
            self.kirby.transform = CGAffineTransform(translationX: 100, y: 100)
        }
        
        self.view.makeToast("아이고 힘들다", position: .top)
    }
        
    @objc private func rotateDidTap() {
        UIView.animate(withDuration: 1, delay: 0, options:[.beginFromCurrentState]) {
            self.kirby.transform = CGAffineTransform(rotationAngle: .pi)
        }
        self.view.makeToast("아이고 힘들다", position: .top)

    }
        
    @objc private func scaleDidTap() {
        UIView.animate(withDuration: 1, delay: 0, options:[.beginFromCurrentState]) {
            self.kirby.transform = CGAffineTransform(scaleX: 5, y: 5 )
        }
        self.view.makeToast("아이고 힘들다", position: .top)

    }
    
    @objc private func amazingBtnDidTap() {
        UIView.animateKeyframes(withDuration: 2, delay: 0, options: [.beginFromCurrentState]) {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/4) {
                let translation = CGAffineTransform(translationX: 100, y: 100)
                let rotation = CGAffineTransform(rotationAngle: .pi)
                self.kirby.transform = translation.concatenating(rotation)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 1/4, relativeDuration: 1/4) {
                let translation = CGAffineTransform(translationX: 100, y: -100)
                let rotation = CGAffineTransform(rotationAngle: .pi)
                self.kirby.transform = translation.concatenating(rotation)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 2/4, relativeDuration: 1/4) {
                let translation = CGAffineTransform(translationX: -100, y: -100)
                let rotation = CGAffineTransform(rotationAngle: .pi)
                self.kirby.transform = translation.concatenating(rotation)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 3/4, relativeDuration: 1/4) {
                let translation = CGAffineTransform(translationX: -100, y: 100)
                let rotation = CGAffineTransform(rotationAngle: .pi)
                self.kirby.transform = translation.concatenating(rotation)
            }
        }
        self.view.makeToast("이거 봤으면 인간적으로 돈 내자.", position: .top)

    }
    
    
    
    
    
    
    func setHierarchy() {
        addSubviews(kirby, transFormButton, rotateButton, scaleButton, AmazingButton)
    }
    
    
    func setLayout() {
        
        kirby.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(200)
            $0.width.height.equalTo(200)
        }
        
        transFormButton.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        
        rotateButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        
        scaleButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        
        AmazingButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(transFormButton.snp.top).offset(-20)
            $0.width.equalTo(150)
            $0.height.equalTo(50)
        }
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setHierarchy()
        setLayout()
        
        view.layoutIfNeeded()

        AmazingButton.applyGradient(colors: [UIColor.blue, UIColor.purple])
        
        
    }
    

}


#Preview {
    MainViewController()
}
