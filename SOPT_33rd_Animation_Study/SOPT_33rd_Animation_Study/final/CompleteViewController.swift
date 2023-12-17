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
    private let emitterLayer = CAEmitterLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setUpEmitterLayer()
        showEmitterCell()
    }
    
    private func setUpEmitterLayer() {
        emitterLayer.emitterCells = [emitterCoinCell]
    }
    
    private var emitterCoinCell: CAEmitterCell {
        let cell = CAEmitterCell()
        cell.contents = UIImage(named: "coin")?.cgImage
        
        cell.lifetime = 3
        cell.birthRate = 40
        
        cell.scale = 0.09
        cell.scaleRange = 0.04
        
        cell.spin = 5
        cell.spinRange = 10
        
        cell.emissionRange = CGFloat.pi * 2
        
        cell.velocity = 500
        cell.velocityRange = 50
        cell.yAcceleration = 800
        
        return cell
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
    
    private func showEmitterCell() {
        let x = UIScreen.main.bounds.width / 2
        let y = UIScreen.main.bounds.height / 4

        emitterLayer.emitterPosition = CGPoint(x: x, y: y)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { [weak self] in
            self?.emitterLayer.birthRate = 0
        }
        
        view.layer.addSublayer(emitterLayer)
    }
}

extension CompleteViewController {
    @objc private func completeButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
}
