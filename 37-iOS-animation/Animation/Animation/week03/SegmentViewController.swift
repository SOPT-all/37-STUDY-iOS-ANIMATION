//
//  SegmentViewController.swift
//  Animation
//
//  Created by 진소은 on 12/1/25.
//

import UIKit

import SnapKit
import Then

final class SegmentViewController: UIViewController {

    private let segmentControl = UISegmentedControl(items: ["눕담곰", "쭈굴담곰", "담곰일뻔한것"])
    private let damgom1View = UIImageView(image: UIImage(named: "img_damgom2"))
    private let damgom2View = UIImageView(image: UIImage(named: "img_damgom3"))
    private let damgom3View = UIImageView(image: UIImage(named: "img_damgom4"))

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupLayout()
        setAddTarget()

        segmentControl.selectedSegmentIndex = 0
        didChangeValue(segment: segmentControl)
    }

    private func setupLayout() {
        view.addSubviews(segmentControl, damgom1View, damgom2View, damgom3View)

        segmentControl.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.centerX.equalToSuperview()
        }

        [damgom1View, damgom2View, damgom3View].forEach {
            $0.snp.makeConstraints {
                $0.center.equalToSuperview()
                $0.width.height.equalTo(200)
            }
        }
    }

    private func setAddTarget() {
        segmentControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
    }

    @objc
    private func didChangeValue(segment: UISegmentedControl) {
        let index = segment.selectedSegmentIndex
        damgom1View.isHidden = index != 0
        damgom2View.isHidden = index != 1
        damgom3View.isHidden = index != 2
    }
}
