//
//  GridView.swift
//  Terits
//
//  Created by 최하늘 on 12/1/23.
//

import UIKit
import SnapKit

final class GridView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addGridLines()
    }
    
    private func configUI() {
        self.configBackgroundColor(color: .clear)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray.cgColor
        
        self.snp.makeConstraints { make in
            make.width.equalTo(Constant.row * Int(Constant.gridSize))
            make.height.equalTo(Constant.col * Int(Constant.gridSize))
        }
    }
    
    private func addGridLines() {
        for y in stride(from: 0, to: self.bounds.height, by: Constant.gridSize) {
            let lineView = UIView()
            lineView.backgroundColor = .gray.withAlphaComponent(0.1)
            self.addSubview(lineView)
            
            lineView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(1)
                make.top.equalToSuperview().offset(y)
            }
        }
        
        for x in stride(from: 0, to: self.bounds.width, by: Constant.gridSize) {
            let lineView = UIView()
            lineView.backgroundColor = .gray.withAlphaComponent(0.1)
            self.addSubview(lineView)
            
            lineView.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.width.equalTo(1)
                make.leading.equalToSuperview().offset(x)
            }
        }
    }
}
