//
//  FilterCell.swift
//  LUTFilterExample
//
//  Created by 王文杰 on 2019/7/20.
//  Copyright © 2019 wangwenjie. All rights reserved.
//

import Foundation
import UIKit

class FilterCell: UICollectionViewCell {
  static let identifier = "FilterCell"
  let lb = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setup() {
    lb.font = UIFont.systemFont(ofSize: 14)
    addSubview(lb)
    lb.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      lb.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      lb.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    ])
  }
  
  func updateCell(filter: String, selected: Bool) {
    lb.text = filter
    lb.sizeToFit()
    lb.textColor = selected ? UIColor.blue : UIColor.black
  }
}
