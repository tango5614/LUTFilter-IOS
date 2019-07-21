//
//  ViewController.swift
//  LUTFilterExample
//
//  Created by 王文杰 on 2019/7/20.
//  Copyright © 2019 wangwenjie. All rights reserved.
//

import Foundation
import UIKit
import LUTFilter

private let filters = ["Labrador", "Siamese", "Persian", "Pug", "Maine", "Beagle", "Shorthair", "Poodle", "Birman", "Corgis"]
class ViewController: UIViewController {
  let iv = UIImageView(image: UIImage(named: "preview"))
  var cv: UICollectionView!
  var cvLayout: UICollectionViewFlowLayout!
  var selectedFilter: String?
  let original = UIImage(named: "preview")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    setCollectionView()
    setUI()
  }
  func setCollectionView() {
    cvLayout = UICollectionViewFlowLayout()
    cvLayout.scrollDirection = .horizontal
    cvLayout.itemSize = CGSize(width: 80, height: 80)
    cvLayout.minimumInteritemSpacing = 8
    cv = UICollectionView(frame: .zero, collectionViewLayout: cvLayout)
    cv.register(FilterCell.self, forCellWithReuseIdentifier: FilterCell.identifier)
    cv.delegate = self
    cv.dataSource = self
    cv.backgroundColor = .white
    
  }
  func setUI() {
    view.addSubview(iv)
    view.addSubview(cv)
    iv.contentMode = .scaleAspectFit
//    view.translatesAutoresizingMaskIntoConstraints = false
    iv.translatesAutoresizingMaskIntoConstraints = false
    cv.translatesAutoresizingMaskIntoConstraints = false
    
    NSLayoutConstraint.activate([
      iv.heightAnchor.constraint(equalToConstant: 400.0),
      iv.widthAnchor.constraint(equalToConstant: 300.0),
      iv.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      iv.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    
    NSLayoutConstraint.activate([
      cv.topAnchor.constraint(equalTo: iv.bottomAnchor),
      cv.heightAnchor.constraint(equalToConstant: 80),
      cv.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
      cv.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    ])
  }
}

extension ViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if (indexPath.item == 0) {
      selectedFilter = nil
    } else {
      selectedFilter = filters[indexPath.item - 1]
    }
    
    if selectedFilter != nil {
      iv.image = original!.applyLUTFilter(LUT: UIImage(named: selectedFilter!), volume: 1.0)
    } else {
      iv.image = original!
    }
    
    collectionView.reloadData()
  }
}

extension ViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return filters.count + 1
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCell.identifier, for: indexPath) as! FilterCell
    if (indexPath.item == 0) {
      cell.updateCell(filter: "original", selected: selectedFilter == nil)
    } else {
      cell.updateCell(filter: filters[indexPath.item - 1], selected: selectedFilter == filters[indexPath.item - 1])
    }
    return cell
  }
}
