//
//  Constant.swift
//  Terits
//
//  Created by 최하늘 on 12/1/23.
//

import UIKit

struct Constant {
    static let screenWidth: CGFloat = UIScreen.main.bounds.width
    static let screenHeight: CGFloat = UIScreen.main.bounds.height
    
    static let row: Int = 10
    static let col: Int = 17
    
    static var brickValue: Brick = BrickManager().makeBrick()
    static let gridSize: CGFloat = CGFloat(Constant.brickValue.brickSize)
    static var backgroundArr: [[Int]] = []
    
    static var dx: Int = 6
    static var dy: Int = 1
    
    static var xOffset: CGFloat = 0
    static var yOffset: CGFloat = 0
    
    static func reset() {
        Constant.brickValue = BrickManager().makeBrick()
        Constant.dx = 6
        Constant.dy = 1
        Constant.xOffset = 0
        Constant.yOffset = 0
    }
}


