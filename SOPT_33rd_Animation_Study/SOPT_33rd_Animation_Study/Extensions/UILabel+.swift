//
//  UILabel+.swift
//  SOPT_33rd_Animation_Study
//
//  Created by 정채은 on 12/16/23.
//

import UIKit

extension UILabel {
    func shakeLabel(duration: Double = 0.3, delay: Double = 0, damping: Double = 0.3, velocity: Double = 0.8) {
        self.transform = CGAffineTransform(translationX: 20, y: 0)
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: damping,
                       initialSpringVelocity: velocity,
                       options: [.curveEaseInOut]) {
            self.transform = .identity
        }
    }
}
