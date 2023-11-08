//
//  UIButton+.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 11/8/23.
//

import UIKit

extension UIButton {
    func shakeButton() {
        self.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 0.2,
                       initialSpringVelocity: 1,
                       options: [.curveEaseInOut]) {
            self.transform = .identity
        }
    }
}
