//
//  BackgroundViewController.swift
//  Terits
//
//  Created by 최하늘 on 11/16/23.
//

import UIKit
import SnapKit

protocol MovedBrick {
    func move()
}

final class BackgroundViewController: UIViewController {
    
    private let gridView = GridView()
    private let holdBrickView = HoldBrickView()
    private let nextBrickView = NextBrickView()
    private var brickView = UIView()
    
    private let leftButton = LeftButton()
    private let rightButton = RightButton()
    private let rotationButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("돌려돌려", for: .normal)
        return button
    }()
    
    private let row: Int = Constant.row
    private let col: Int = Constant.col
    private let viewWidth: Int = Constant.row * Int(Constant.gridSize)
    private let viewHeight: Int = Constant.col * Int(Constant.gridSize)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        Constant.backgroundArr = Array(repeating: Array(repeating: 0, count: row+2), count: col+2)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.configBackgroundColor()
        print("viewDidLoad")
        configUI()
        makeBackgroundArr()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        makeBrick()
        configButtons()
    }
    
    private func makeBrick() {
        brickView = BrickView()
        gridView.addSubview(brickView)
        
        brickView.snp.makeConstraints { make in
            make.top.equalTo(gridView.snp.top).offset(Constant.gridSize / 2)
            make.centerX.equalTo(gridView.snp.centerX).offset(Constant.gridSize / 2)
        }
        
        for point in Constant.brickValue.points {
            let x = Int(point.x) + Constant.dx
            let y = Int(point.y) + Constant.dy
            
            Constant.backgroundArr[y][x] = 1
        }
//        for i in Constant.backgroundArr {
//            print(i)
//        }
    }
     
    private func configUI() {
        self.view.addSubview([gridView, holdBrickView, nextBrickView, leftButton, rightButton, rotationButton])
        
        gridView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.leading.equalTo(self.view.safeAreaLayoutGuide).offset(10)
            make.width.equalTo(viewWidth)
            make.height.equalTo(viewHeight)
        }
        
        holdBrickView.snp.makeConstraints { make in
            make.top.equalTo(gridView.snp.top)
            make.leading.equalTo(gridView.snp.trailing).offset(10)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            make.height.equalTo(Double(viewHeight) * 0.2)
        }
        
        nextBrickView.snp.makeConstraints { make in
            make.top.equalTo(holdBrickView.snp.bottom).offset(10)
            make.leading.trailing.equalTo(holdBrickView)
            make.bottom.equalTo(gridView.snp.bottom)
        }
        
        leftButton.snp.makeConstraints { make in
            make.top.equalTo(gridView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.height.width.equalTo(50)
        }
        
        rightButton.snp.makeConstraints { make in
            make.top.equalTo(leftButton.snp.top)
            make.leading.equalTo(leftButton.snp.trailing).offset(20)
            make.height.width.equalTo(rightButton.snp.height)
        }
        
        rotationButton.snp.makeConstraints { make in
            make.top.equalTo(leftButton.snp.top)
            make.trailing.equalTo(self.view.safeAreaLayoutGuide).offset(-10)
            make.height.width.equalTo(50)
        }
    }
    
    private func makeBackgroundArr() {
        for i in 0..<row+2 {
            Constant.backgroundArr[col+1][i] = -1
        }
        for i in 0..<col+2 {
            Constant.backgroundArr[i][0] = -1
        }
        for i in 0..<col+2 {
            Constant.backgroundArr[i][row+1] = -1
        }
        for i in 0..<row+2 {
            Constant.backgroundArr[0][i] = -1
        }
    }
    
    private func configButtons() {
        leftButton.movedBrick = self
        rightButton.movedBrick = self
        
        rotationButton.addTarget(self, action: #selector(tapRotationButton), for: .touchUpInside)
    }
    
    @objc private func tapRotationButton() {
        print("돌리기~")
        if Constant.brickValue.brickName == "brick5" { return }
        
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self else { return }
            brickView.transform = brickView.transform.rotated(by: .pi / 2)
        }
    }
}

extension BackgroundViewController: MovedBrick {
    func move() {
        brickView.snp.updateConstraints { make in
            make.centerX.equalTo(gridView.snp.centerX).offset((Constant.gridSize / 2) + Constant.xOffset)
        }
    }
}
