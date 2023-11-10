//
//  UIButton+.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 11/8/23.
//

import UIKit

extension UIButton {
    func shakeButton(duration: Double = 0.3, delay: Double = 0, damping: Double = 0.2, velocity: Double = 1) {
        self.transform = CGAffineTransform(translationX: 0, y: 20)
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: damping,
                       initialSpringVelocity: velocity,
                       options: [.curveEaseInOut]) {
            self.transform = .identity
        }
    }
}
