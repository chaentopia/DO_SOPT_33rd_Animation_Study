//
//  FinalViewController.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 12/13/23.
//

import UIKit

import SnapKit
import Then

final class FinalViewController: UIViewController {
    
    var paddingValue = 18
    
    private let titleLabel = UILabel()
    private let fromLabel = UILabel()
    private let balanceLabel = UILabel()
    private let toLabel = UILabel()
    private let accountLabel = UILabel()
    private let errorLabel = UILabel()
    
    private let amountLabel = UILabel()
    private let nextButton = UIButton()

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
        
        titleLabel.do {
            $0.text = "송금하기"
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Bold", size: 15)
        }
        
        fromLabel.do {
            $0.text = "내 국민-보통예금 통장에서"
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Bold", size: 20)
        }
        
        balanceLabel.do {
            $0.text = "잔액 1,000,000원"
            $0.textColor = UIColor(hexCode: "5D6477")
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        }
        
        toLabel.do {
            $0.text = "정채은님의 통장으로"
            $0.textColor = .white
            $0.font = UIFont(name: "Pretendard-Bold", size: 20)
        }
        
        accountLabel.do {
            $0.text = "신한 11234567890"
            $0.textColor = UIColor(hexCode: "5D6477")
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 12)
        }
        
        amountLabel.do {
            $0.text = "얼마나 옮길까요?"
            $0.font = UIFont(name: "Pretendard-SemiBold", size: 25)
            $0.textColor = UIColor(hexCode: "43464D")
        }
        
        errorLabel.do {
            $0.text = "한 번에 200만원까지 옮길 수 있어요."
            $0.textColor = UIColor(hexCode: "EC5E5E")
            $0.font = UIFont(name: "Pretendard-Bold", size: 12)
        }
        
        nextButton.do {
            $0.backgroundColor = UIColor(hexCode: "3E74FF")
            $0.setTitle("다음", for: .normal)
            $0.titleLabel?.textColor = .white
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
            $0.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        [titleLabel, fromLabel, balanceLabel, toLabel, accountLabel, amountLabel, errorLabel, nextButton].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.centerX.equalToSuperview()
        }
        
        fromLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(38)
            $0.leading.equalToSuperview().inset(paddingValue)
        }
        
        balanceLabel.snp.makeConstraints {
            $0.top.equalTo(fromLabel.snp.bottom).offset(8)
            $0.leading.equalTo(fromLabel)
        }
        
        toLabel.snp.makeConstraints {
            $0.top.equalTo(balanceLabel.snp.bottom).offset(47)
            $0.leading.equalTo(fromLabel)
        }
        
        accountLabel.snp.makeConstraints {
            $0.top.equalTo(toLabel.snp.bottom).offset(8)
            $0.leading.equalTo(fromLabel)
        }
        
        amountLabel.snp.makeConstraints {
            $0.top.equalTo(accountLabel.snp.bottom).offset(57)
            $0.leading.equalTo(fromLabel)
        }
        
        errorLabel.snp.makeConstraints {
            $0.top.equalTo(amountLabel.snp.bottom).offset(8)
            $0.leading.equalTo(fromLabel)
        }
        
        nextButton.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(60)
            $0.top.equalTo(amountLabel.snp.bottom).offset(124)
        }
    }
}


extension FinalViewController {
    @objc private func nextButtonTapped() {
        print("다음")
    }
}