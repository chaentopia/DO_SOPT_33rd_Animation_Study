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
    
    private let myView = UIImageView()
    private let titleLabel = UILabel()
    private let timeLabel = UILabel()
    
    //타이머 변수 선언
    private var timer : Timer?
    //타이머에 사용할 번호값
    private var timerNum: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setTarget()
        startTimer()
    }
    
    private func setUI() {
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .black
        
        myView.do {
            $0.image = UIImage(named: "ikk.png")
            $0.contentMode = .scaleAspectFit
            $0.isUserInteractionEnabled = true
            $0.frame = CGRect(x: UIScreen.main.bounds.width / 2 - 40, y: UIScreen.main.bounds.height / 2 - 40, width: 80, height: 80)
        }
        
        titleLabel.do {
            $0.text = "류희재를 피해 60초를 버텨라!"
            $0.font = .boldSystemFont(ofSize: 18)
            $0.textColor = .black
            $0.textAlignment = .center
            $0.layer.backgroundColor = UIColor.white.cgColor
        }
        
        timeLabel.do {
            $0.text = "60초"
            $0.font = .systemFont(ofSize: 20)
            $0.textColor = .black
            $0.textAlignment = .center
            $0.layer.cornerRadius = 15
            $0.layer.backgroundColor = UIColor.white.cgColor
            $0.clipsToBounds = true
        }
    }
    
    private func setLayout() {
        self.view.addSubview(myView)
        self.view.addSubview(titleLabel)
        self.view.addSubview(timeLabel)
          
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
    }
    
    private func setTarget() {
        //UIPanGestureRecognizer
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(viewPan))
        self.myView.addGestureRecognizer(panGesture)
    }
    
    @objc func viewPan(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)

        if let viewToMove = gesture.view {
            viewToMove.center = CGPoint(x: viewToMove.center.x + translation.x, y: viewToMove.center.y + translation.y)
        }
        
        gesture.setTranslation(.zero, in: view)
    }
    
    private func startTimer() {
        if timer != nil && timer!.isValid {
            timer!.invalidate()
        }
     
        timerNum = 60
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCallback), userInfo: nil, repeats: true)
    }
    
    //타이머 동작 func
    @objc func timerCallback() {
        self.timeLabel.text = "\(timerNum)초"
     
        switch timerNum {
        case 0..<1:
            self.view.backgroundColor = .systemGray
        case 1..<10:
            self.view.backgroundColor = .systemGray2
        case 10..<20:
            self.view.backgroundColor = .systemGray3
        case 20..<30:
            self.view.backgroundColor = .systemGray4
        case 30..<40:
            self.view.backgroundColor = .systemGray5
        case 40..<50:
            self.view.backgroundColor = .systemGray6
        case 50...60:
            self.view.backgroundColor = .black
        default:
            self.view.backgroundColor = .black
        }
        
        //timerNum이 0이면(60초 경과) 타이머 종료
        if(timerNum == 0) {
            timer?.invalidate()
            timer = nil
        }
     
        //timerNum -1 감소시키기
        timerNum-=1
    }
}
