//
//  KeyboardCollectionViewCell.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 12/16/23.
//

import UIKit

import SnapKit
import Then

protocol KeyBoardButtonDelegate {
    func keyboardButtonTapped(data: String)
}

final class KeyboardCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "KeyboardCollectionViewCell"
    var keyboardButtonDelegate: KeyBoardButtonDelegate?
    
    let keyBoardButton = UIButton()
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
            $0.layer.cornerRadius = 10
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
        keyboardButtonDelegate?.keyboardButtonTapped(data: numberIndex)
        
        UIView.animate(withDuration: 0.15) { [self] in
            keyBoardButton.layer.backgroundColor = UIColor(hexCode: "3B3D44", alpha: 1.0).cgColor
        } completion: { _ in
            UIView.animate(withDuration: 0.3) { [self] in
                keyBoardButton.layer.backgroundColor = UIColor(hexCode: "3B3D44", alpha: 0).cgColor
            }
        }
    }
}
