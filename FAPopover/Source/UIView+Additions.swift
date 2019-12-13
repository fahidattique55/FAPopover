//
//  UIView+Additions.swift
//  FAPopover
//
//  Created by fahid.attique on 13/12/2019.
//  Copyright © 2019 fahid.attique. All rights reserved.
//

import UIKit

extension UIView {
    
    func fadeIn(duration: TimeInterval = 1.0, alpha:CGFloat = 1.0) {
        UIView.animate(withDuration: duration, animations: { self.alpha = alpha })
    }
    
    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: duration, animations: { self.alpha = 0 })
    }
}
