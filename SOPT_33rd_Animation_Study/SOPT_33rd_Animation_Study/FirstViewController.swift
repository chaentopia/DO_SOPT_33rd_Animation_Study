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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        didMoveTap()
    }
    
    private func setUI() {
        view.backgroundColor = .white
        view.addSubview(testView)
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
 }
