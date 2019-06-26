//
//  UINavigationController.swift
//  countdown
//
//  Created by Steven McCracken on 3/9/18.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit

extension UINavigationController {
  
  func addCancelButton(side: UINavigationBarSide) {
    let button = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancelButton(_:)))
    addButton(button, toSide: side)
  }
  
  func addDoneButton(side: UINavigationBarSide, withAction action: Selector? = nil, target: Any? = nil) {
    let button = UIBarButtonItem(barButtonSystemItem: .done, target: target, action: action)
    addButton(button, toSide: side)
  }
  
  func addButton(_ button: UIBarButtonItem, toSide side: UINavigationBarSide) {
    childViewControllers.forEach {
      switch side {
      case .left:
        $0.navigationItem.leftBarButtonItem = button
      case .right:
        $0.navigationItem.rightBarButtonItem = button
      }
    }
  }
  
  @objc
  func didTapCancelButton(_ sender: UIBarButtonItem) {
    dismiss(animated: true)
  }
}
