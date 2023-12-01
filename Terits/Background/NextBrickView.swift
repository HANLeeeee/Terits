//
//  NextBrickView.swift
//  Terits
//
//  Created by 최하늘 on 12/1/23.
//

import UIKit

final class NextBrickView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        self.configBackgroundColor(color: .clear)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
    }
}
