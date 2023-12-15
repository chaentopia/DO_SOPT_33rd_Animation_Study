//
//  KeyboardCollectionViewCell.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 12/16/23.
//

import UIKit

import SnapKit
import Then

final class KeyboardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "KeyboardCollectionViewCell"
    
    private let keyBoardButton = UIButton()
    var numberIndex = "1"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        keyBoardButton.do {
            $0.titleLabel?.font = UIFont(name: "Pretendard-Medium", size: 15)
            $0.titleLabel?.textColor = UIColor(hexCode: "DDDDDF")
            $0.imageView?.contentMode = .scaleAspectFill
            $0.imageView?.tintColor = .white
            $0.addTarget(self, action: #selector(keyBoardButtonTapped), for: .touchUpInside)
        }
    }
    
    private func setLayout() {
        self.addSubview(keyBoardButton)
        
        keyBoardButton.snp.makeConstraints {
            $0.height.equalTo(52)
            $0.width.equalTo(85)
            $0.center.equalToSuperview()
        }
        
        keyBoardButton.imageView?.snp.makeConstraints {
            $0.width.equalTo(20)
            $0.height.equalTo(17)
        }
    }
    
    func bindData(index: String) {
        numberIndex = index
        if numberIndex == "-1" {
            keyBoardButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        } else {
            keyBoardButton.setTitle(numberIndex, for: .normal)
        }
    }
    
    @objc func keyBoardButtonTapped() {
        print(numberIndex)
    }
}
