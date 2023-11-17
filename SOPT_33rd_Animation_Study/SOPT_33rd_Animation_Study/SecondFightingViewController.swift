//
//  SecondFightingViewController.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 11/18/23.
//

import UIKit

import SnapKit
import Then

final class SecondFightingViewController: UIViewController {
    
    private let ikkImageView = UIImageView()
    private let hidiImageView = UIImageView()
    private let titleLabel = UILabel()
    private let timeLabel = UILabel()
    private let restartButton = UIButton()
    
    //타이머 변수 선언
    private var timer : Timer?
    //타이머에 사용할 번호값
    private var timerNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTarget()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .black
        
        ikkImageView.do {
            $0.image = UIImage(named: "ikk.png")
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = true
            $0.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 40, y: UIScreen.main.bounds.height / 2 - 40, width: 80, height: 80)
        }
        
        hidiImageView.do {
            $0.image = UIImage(named: "hellohidi.png")
            $0.contentMode = .scaleAspectFit
            $0.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 40, y: UIScreen.main.bounds.height - 200, width: 80, height: 120)
        }
        
        titleLabel.do {
            $0.text = "류희재를 피해 30초를 버텨라!"
            $0.font = .boldSystemFont(ofSize: 18)
            $0.textColor = .black
            $0.textAlignment = .center
            $0.layer.backgroundColor = UIColor.white.cgColor
        }
        
        timeLabel.do {
            $0.text = "30초"
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = .black
            $0.textAlignment = .center
            $0.layer.cornerRadius = 15
            $0.layer.backgroundColor = UIColor.white.cgColor
            $0.clipsToBounds = true
        }
        
        restartButton.do {
            $0.setImage(UIImage(systemName: "arrow.clockwise.circle.fill"), for: .normal)
            $0.imageView?.tintColor = .white
            $0.isHidden = true
        }
    }
    
    private func setLayout() {
        self.view.addSubview(ikkImageView)
        self.view.addSubview(hidiImageView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(timeLabel)
        self.view.addSubview(restartButton)
          
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(80)
            $0.width.equalToSuperview()
            $0.height.equalTo(35)
        }
        
        timeLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).offset(50)
            $0.width.equalTo(90)
            $0.height.equalTo(35)
        }
        
        restartButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(40)
            $0.width.height.equalTo(35)
            $0.centerY.equalTo(timeLabel)
        }
        
        restartButton.imageView?.snp.makeConstraints {
            $0.width.height.equalToSuperview()
        }
    }
    
    private func setTarget() {
        //UIPanGestureRecognizer
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewPan))
        self.ikkImageView.addGestureRecognizer(panGesture)
        
        self.restartButton.addTarget(self, action: #selector(restartButtonTapped), for: .touchUpInside)
    }
    
    @objc func viewPan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)

        if let viewToMove = gesture.view {
            viewToMove.center = CGPoint(x: viewToMove.center.x + translation.x, y: viewToMove.center.y + translation.y)
            
            // 타이머가 동작 중이지 않으면 시작
            if timer == nil || !timer!.isValid {
                startTimer()
            }
            
            if areFramesIntersecting(frame1: viewToMove.frame, frame2: hidiImageView.frame) {
                // 게임 종료: 실패
                endGame(with: "실패")
            }
        }
        
        gesture.setTranslation(.zero, in: view)
    }
    
    private func startTimer() {
        if timer != nil && timer!.isValid {
            timer!.invalidate()
        }
     
        timerNum = 30
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    //타이머 동작 func
    @objc func timerCallback() {
        self.timeLabel.text = "\(timerNum)초"
     
        switch timerNum {
        case 0..<1:
            self.view.backgroundColor = .systemGray
        case 1..<10:
            self.view.backgroundColor = .systemGray3
        case 10..<20:
            self.view.backgroundColor = .systemGray5
        case 20...30:
            self.view.backgroundColor = .black
        default:
            self.view.backgroundColor = .black
        }
        
        //timerNum이 0이면(30초 경과) 타이머 종료
        if(timerNum == 0) {
            timer?.invalidate()
            timer = nil
            self.restartButton.isHidden = false
            endGame(with: "성공")
        }
     
        //timerNum -1 감소시키기
        if timerNum > 0 {
            timerNum-=1
        }
    }
    
    @objc private func restartButtonTapped() {
        restartButton.isHidden = true
        self.view.backgroundColor = .black
        self.timeLabel.text = "30초"
        self.titleLabel.text = "류희재를 피해 30초를 버텨라!"
        titleLabel.textColor = .black
        ikkImageView.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 40, y: UIScreen.main.bounds.height / 2 - 40, width: 80, height: 80)
        hidiImageView.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 40, y: UIScreen.main.bounds.height - 200, width: 80, height: 120)

    }
    
    func endGame(with message: String) {
        timer?.invalidate()
        timer = nil
        
        titleLabel.text = message
        titleLabel.textColor = .red
        
        restartButton.isHidden = false
    }
    
    func areFramesIntersecting(frame1: CGRect, frame2: CGRect) -> Bool {
        return frame1.intersects(frame2)
    }
}
