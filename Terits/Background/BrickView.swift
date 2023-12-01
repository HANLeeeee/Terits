//
//  BrickView.swift
//  Terits
//
//  Created by 최하늘 on 12/2/23.
//

import UIKit
import SnapKit

final class BrickView: UIView {
    let brick = Constant.brickValue
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        for point in brick.points {
            let view = UIView()
            view.backgroundColor = brick.color
            view.layer.borderWidth = 1
            view.layer.borderColor = UIColor.gray.withAlphaComponent(0.8).cgColor
            self.addSubview(view)
            
            view.snp.makeConstraints { make in
                make.height.equalTo(Constant.gridSize)
                make.width.equalTo(Constant.gridSize)
                
                make.centerX.equalToSuperview().offset(point.x * Constant.gridSize)
                make.centerY.equalToSuperview().offset(point.y * Constant.gridSize)
            }
        }
    }
}
