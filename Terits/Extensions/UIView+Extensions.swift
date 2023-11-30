//
//  UIView+Extensions.swift
//  Terits
//
//  Created by 최하늘 on 12/1/23.
//

import UIKit

extension UIView {
    func configBackgroundColor(color: UIColor = .systemBackground) {
        self.backgroundColor = color
    }
    
    func addSubview(_ views: [UIView]) {
        views.forEach {
            self.addSubview($0)
        }
    }
}
