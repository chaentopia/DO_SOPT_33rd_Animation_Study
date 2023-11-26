//
//  ThirdViewController.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 11/26/23.
//

import UIKit

class ThirdViewController: UIViewController {
    let testView = TestView(frame: UIScreen.main.bounds)

    override func loadView() {
        super.loadView()
        self.view = testView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        testView.setAnimateBackGround()
    }
}

class TestView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        self.backgroundColor = .white
    }
    
    func setAnimateBackGround() {
        let animation = CABasicAnimation(keyPath: "backgroundColor")
        animation.duration = 4
        animation.fromValue = UIColor.red.cgColor
        animation.toValue = UIColor.blue.cgColor
        animation.isRemovedOnCompletion = false
        self.layer.add(animation, forKey: "backgroundAni")
    }
}
