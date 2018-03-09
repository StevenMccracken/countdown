//
//  UIImage.swift
//  countdown
//
//  Created by Steven McCracken on 3/9/18.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit

extension UIImage {
  
  enum NamedImage: String {
    case clock = "clock"
    case checkmark = "checkmark"
  }
  
  convenience init?(named name: NamedImage) {
    self.init(named: name.rawValue)
  }
}
