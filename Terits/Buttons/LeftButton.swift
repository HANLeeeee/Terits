//
//  LeftButton.swift
//  Terits
//
//  Created by 최하늘 on 12/4/23.
//

import UIKit

final class LeftButton: UIButton {
    
    var movedBrick: MovedBrick?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        self.setTitle("왼쪽", for: .normal)
        self.addTarget(self, action: #selector(tapLeftButton), for: .touchUpInside)
    }
    
    @objc private func tapLeftButton() {
        if isMovable() {
            Constant.xOffset -= Constant.gridSize
            movedBrick?.move()
            
            Constant.dx -= 1
            for point in Constant.brickValue.points {
                let x = Int(point.x) + Constant.dx
                let y = Int(point.y) + Constant.dy
                
                Constant.backgroundArr[y][x + 1] -= 1
                Constant.backgroundArr[y][x] += 1
            }
        }
    }
    
    private func isMovable() -> Bool {
        for point in Constant.brickValue.points {
            let x = Int(point.x) + Constant.dx
            let y = Int(point.y) + Constant.dy
            
            if Constant.backgroundArr[y][x - 1] < 0 {
                return false
            }
        }
        return true
    }
}
