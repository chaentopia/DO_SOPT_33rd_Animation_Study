//
//  FirstFightingViewController.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 11/11/23.
//

import UIKit

import SnapKit
import Then

final class FirstFightingViewController: UIViewController {
    
    let titleLabel = UILabel()
    let shakingButton = UIButton()
    let toastButton = UIButton()
    let ikkButton = UIButton()
    
    let toastLabel = UILabel(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 150, y: UIScreen.main.bounds.height - 50, width: 300, height: 40))
    let ikkImageView = UIImageView()
    
    var isIkk = true

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setAddTarget()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setAddTarget() {
        shakingButton.addTarget(self, action: #selector(shakingButtonTapped), for: .touchUpInside)
        toastButton.addTarget(self, action: #selector(toastButtonTapped), for: .touchUpInside)
        ikkButton.addTarget(self, action: #selector(ikkButtonTapped), for: .touchUpInside)
    }
    
    private func setStyle() {
        view.backgroundColor = .black
        
        titleLabel.do {
            $0.text = "♡⋆⁺₊⋆Choose The Button!⋆⁺₊⋆☾"
            $0.font = .boldSystemFont(ofSize: 25)
            $0.textColor = .systemPink
        }
        
        shakingButton.do {
            $0.setTitle("Shake Me!", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemPink
            $0.layer.cornerRadius = 25
            $0.clipsToBounds = true
        }
        
        toastButton.do {
            $0.setTitle("Toast Me!", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemPink
            $0.layer.cornerRadius = 25
            $0.clipsToBounds = true
        }
        
        ikkButton.do {
            $0.setTitle("IKK Me!", for: .normal)
            $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
            $0.setTitleColor(.white, for: .normal)
            $0.backgroundColor = .systemPink
            $0.layer.cornerRadius = 25
            $0.clipsToBounds = true
        }
        
        toastLabel.do {
            $0.text = "Hello I'm Toast Message!"
            $0.font = .boldSystemFont(ofSize: 15)
            $0.textColor = .darkGray
            $0.layer.backgroundColor = UIColor.white.cgColor
            $0.layer.cornerRadius = 10
            $0.clipsToBounds = true
            $0.textAlignment = .center
            $0.alpha = 0
        }
        
        ikkImageView.do {
            $0.image = UIImage(named: "ikk.png")
            $0.contentMode = .scaleAspectFit
            $0.alpha = 0.0
        }
    }
    
    private func setLayout() {
        
        [titleLabel, shakingButton, toastButton, ikkButton, toastLabel, ikkImageView].forEach {
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints {
            $0.bottom.equalTo(shakingButton.snp.top).offset(-50)
            $0.centerX.equalToSuperview()
        }
        
        shakingButton.snp.makeConstraints {
            $0.bottom.equalTo(toastButton.snp.top).offset(-30)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        toastButton.snp.makeConstraints {
            $0.center.equalToSuperview().offset(-50)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        ikkButton.snp.makeConstraints {
            $0.top.equalTo(toastButton.snp.bottom).offset(30)
            $0.height.equalTo(50)
            $0.leading.trailing.equalToSuperview().inset(40)
        }
        
        ikkImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(-5)
            $0.width.equalTo(100)
        }
    }
    
    @objc private func shakingButtonTapped() {
        shakingButton.shakeButton(duration: 1, damping: 0.1, velocity: 3)
    }
    
    @objc private func toastButtonTapped() {

        UIView.animate(withDuration: 1.0) { [self] in
            toastLabel.frame.origin.y -= 120
            toastLabel.alpha = 1.0
        } completion: { _ in
            UIView.animate(withDuration: 2.0) { [self] in
                toastLabel.frame.origin.y += 120
                toastLabel.alpha = 0.0
            }
        }
    }
    
    @objc private func ikkButtonTapped() {

        UIView.animate(withDuration: 1.0) { [self] in
            ikkImageView.transform = CGAffineTransform(scaleX: isIkk ? 2.0 : 1.0, y: isIkk ? 2.0 : 1.0)
            ikkImageView.alpha = isIkk ? 1.0 : 0.0
        }
        
        UIView.transition(with: ikkImageView, duration: 0.6, options: .transitionFlipFromLeft, animations: nil)
        
        isIkk.toggle()
    }
}
