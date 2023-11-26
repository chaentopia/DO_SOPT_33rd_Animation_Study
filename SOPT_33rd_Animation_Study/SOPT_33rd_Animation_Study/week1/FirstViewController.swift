//
//  FirstViewController.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 11/8/23.
//


import UIKit

class FirstViewController: UIViewController {
    
    let testView : UIView = {
        let view = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        view.backgroundColor = .systemPink
        return view
    }()
    
    lazy var testButton : UIButton = {
        let button = UIButton(frame: CGRect(x: 150, y: 400, width: 200, height: 50))
        button.setTitle("짠!", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 17)
        button.titleLabel?.textColor = .brown
        button.layer.backgroundColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(testView)
        view.addSubview(testButton)
    }
    
    @objc private func buttonTapped() {
        springDuration()
        testButton.shakeButton()
    }
    
    private func didMoveTap() {
        UIView.animate(withDuration: 2.0) { [self] in
            testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }
        
        UIView.animate(withDuration: 2.0) { [self] in
            testView.transform = CGAffineTransform(rotationAngle: .pi)
        }
        
        UIView.animate(withDuration: 2.0) { [self] in
            testView.transform = CGAffineTransform(translationX: 200, y: 200)
        }
    }
    
    private func sequentialMove() {
        UIView.animate(withDuration: 2.0) { [self] in
            testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        } completion: { _ in
            UIView.animate(withDuration: 2.0) { [self] in
                testView.transform = CGAffineTransform(rotationAngle: .pi)
            } completion: { _ in
                UIView.animate(withDuration: 2.0) { [self] in
                    testView.transform = CGAffineTransform(translationX: 200, y: 200)
                }
            }
        }
    }
    
    private func sequentialMove2() {
        UIView.animateKeyframes(withDuration: 3.0, delay: 0)  {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1/3) { [self] in
                testView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
            }
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 1/3) { [self] in
                testView.transform = CGAffineTransform(rotationAngle: .pi)
            }
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 1/3) { [self] in
                testView.transform = CGAffineTransform(translationX: 200, y: 200)
            }
        }
    }
    
    private func transitionMove() {
        UIView.transition(with: testView, duration: 0.6, options: .transitionCurlUp, animations: nil)
    }
    
    private func modifyAnimation() {
        UIView.animate(withDuration: 1.0) { [self] in
            UIView.modifyAnimations(withRepeatCount: 3.0, autoreverses: true) {
                testView.frame.origin.x += 100
            }
        }
    }
    
    private func springDuration() {
        UIView.animate (springDuration: 2.0, bounce: 0.5) {
            testView.center.y += 100
        }
    }
}
