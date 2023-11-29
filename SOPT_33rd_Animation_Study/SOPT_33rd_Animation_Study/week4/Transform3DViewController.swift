//
//  Transform3DViewController.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 11/29/23.
//

import UIKit

class Transform3DViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewToTransform = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 100))
        viewToTransform.backgroundColor = .red
        self.view.addSubview(viewToTransform)
        
        var transform = CATransform3DIdentity
        transform.m34 = -1.0 / 500
        transform = CATransform3DRotate(transform, CGFloat(45 * Double.pi / 180), 1, 0, 0)
        viewToTransform.layer.transform = transform
    }
}
