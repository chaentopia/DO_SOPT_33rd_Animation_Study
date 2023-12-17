//
//  CompleteViewController.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 12/16/23.
//

import UIKit

import SnapKit
import Then

final class CompleteViewController: UIViewController {
    
    private let completeButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        view.backgroundColor = UIColor(hexCode: "212327")
        
        completeButton.do {
            $0.backgroundColor = UIColor(hexCode: "3E74FF")
            $0.setTitle("완료", for: .normal)
            $0.titleLabel?.textColor = .white
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
            $0.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
        }
    }
    
    private func setLayout() {
        [completeButton].forEach {
            view.addSubview($0)
        }
        
        completeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(FinalViewController.paddingValue)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
}

extension CompleteViewController {
    @objc private func completeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
