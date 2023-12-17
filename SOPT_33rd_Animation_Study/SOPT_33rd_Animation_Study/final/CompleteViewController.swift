//
//  CompleteViewController.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 12/16/23.
//

import UIKit

import Lottie
import SnapKit
import Then

final class CompleteViewController: UIViewController {
    
    private let loadingView = LottieAnimationView(name: "loadingAnimation")
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let completeButton = UIButton()
    private let emitterLayer = CAEmitterLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        completeTransfer()
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
        
        loadingView.do {
            $0.loopMode = .playOnce
        }
        
        titleLabel.do {
            $0.text = "송금을\n완료했어요!"
            $0.numberOfLines = 2
            $0.textAlignment = .center
            $0.textColor = .white
            $0.alpha = 0
            $0.font = UIFont(name: "Pretendard-Bold", size: 30)
        }
        
        descriptionLabel.do {
            $0.text = "신지원 사랑해 애니메이션 스터디 파이팅!!!"
            $0.textColor = .systemGray2
            $0.font = UIFont(name: "Pretendard-Regular", size: 15)
            $0.alpha = 0
        }
        
        completeButton.do {
            $0.backgroundColor = UIColor(hexCode: "3E74FF")
            $0.setTitle("완료", for: .normal)
            $0.titleLabel?.textColor = .white
            $0.titleLabel?.font = UIFont(name: "Pretendard-Bold", size: 18)
            $0.addTarget(self, action: #selector(completeButtonTapped), for: .touchUpInside)
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
            $0.alpha = 0
            $0.isEnabled = false
        }
    }
    
    private func setLayout() {
        [loadingView, completeButton, titleLabel, descriptionLabel].forEach {
            view.addSubview($0)
        }
        
        loadingView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(15)
        }
        
        completeButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.height.equalTo(60)
            $0.leading.trailing.equalToSuperview().inset(FinalViewController.paddingValue)
            $0.bottom.equalToSuperview().inset(50)
        }
    }
    
    private func completeTransfer() {
        loadingView.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            let type = UINotificationFeedbackGenerator.FeedbackType.success
            let generator = UINotificationFeedbackGenerator()
            generator.prepare()
            generator.notificationOccurred(type)
            
            self?.loadingView.isHidden = true
            self?.loadingView.stop()
            self?.setUpEmitterLayer()
            self?.showEmitterCell()
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
        
        UIView.animate(withDuration: 1) { [self] in
            completeButton.alpha = 1
            titleLabel.alpha = 1
            descriptionLabel.alpha = 1
        }
        completeButton.isEnabled = true
    }
}

extension CompleteViewController {
    @objc private func completeButtonTapped() {
        let style = UIImpactFeedbackGenerator.FeedbackStyle.soft
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
        
        self.navigationController?.popViewController(animated: true)
        
        UIView.animate(withDuration: 0.3) { [self] in
            completeButton.alpha = 0
            titleLabel.alpha = 0
            descriptionLabel.alpha = 0
        } completion: { _ in
            self.loadingView.isHidden = false
        }
    }
}
