//
//  ThirdFightingViewController.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 11/26/23.
//

import UIKit

import Then

class ThirdFightingViewController: UIViewController {
    
    let loadingView = LoadingView().then {
        $0.frame = CGRect(x: 30, y: UIScreen.main.bounds.height / 2, width: UIScreen.main.bounds.width - 60, height: 30)
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.view.addSubview(loadingView)
    }
}

class LoadingView: UIView {
    private let pathLayer = CAShapeLayer()
    
    let gradientColors: [CGColor] = [
          UIColor(red: 237/255, green: 113/255, blue: 173/255, alpha: 1).cgColor,
          UIColor(red: 114/255, green: 119/255, blue: 241/255, alpha: 1).cgColor
      ]

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.setAnimateLoadingView()
    }
    
    func setAnimateLoadingView() {
        let loadingPath = UIBezierPath()
        loadingPath.move(to: CGPoint(x: 0, y: self.bounds.height / 2))
        loadingPath.addLine(to: CGPoint(x: self.bounds.width, y: self.bounds.height / 2))
        
        pathLayer.path = loadingPath.cgPath
        pathLayer.strokeColor = gradientColors[1]
        pathLayer.lineWidth = 30
        pathLayer.strokeStart = 0.0
        self.layer.addSublayer(pathLayer)
        
        let colorAnimation = CABasicAnimation(keyPath: "strokeColor")
        colorAnimation.fromValue = gradientColors[0]
        colorAnimation.toValue = gradientColors[1]
        
        let widthAnimation = CABasicAnimation(keyPath: "strokeEnd")
        widthAnimation.toValue = 1
        widthAnimation.fromValue = 0
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [colorAnimation, widthAnimation]
        groupAnimation.duration = 8
        groupAnimation.isRemovedOnCompletion = true
        
        pathLayer.add(groupAnimation, forKey: "groupAni")
    }
}
