//
//  DownButton.swift
//  Terits
//
//  Created by 최하늘 on 12/5/23.
//

import UIKit

final class DownButton: UIButton {
    
    weak var movedBrick: MovedBrick?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func config() {
        self.setTitle("아래", for: .normal)
        self.addTarget(self, action: #selector(tapDownButton), for: .touchUpInside)
    }
    
    @objc func tapDownButton() {
        if isDownable() {
            possibleDown()
        } else {
            impossibleDown()
        }
    }
    
    private func possibleDown() {
        Constant.yOffset += Constant.gridSize
        movedBrick?.moveDown()
        
        Constant.dy += 1
        for point in Constant.brickValue.points {
            let x = Int(point.x) + Constant.dx
            let y = Int(point.y) + Constant.dy
            
            Constant.backgroundArr[y - 1][x] -= 1
            Constant.backgroundArr[y][x] += 1
        }
    }
    
    private func impossibleDown() {
        for point in Constant.brickValue.points {
            let x = Int(point.x) + Constant.dx
            let y = Int(point.y) + Constant.dy
            
            Constant.backgroundArr[y][x] = -1
        }
        
        movedBrick?.impossibleDown()
    }
    
    private func isDownable() -> Bool {
        for point in Constant.brickValue.points {
            let x = Int(point.x) + Constant.dx
            let y = Int(point.y) + Constant.dy
            
            if Constant.backgroundArr[y + 1][x] < 0 {
                return false
            }
        }
        return true
    }
}
