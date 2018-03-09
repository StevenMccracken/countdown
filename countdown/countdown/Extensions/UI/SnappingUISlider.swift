//
//  SnappingUISlider.swift
//  countdown
//
//  Created by Steven McCracken on 3/3/18.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit

class SnappingUISlider: UISlider {
  
  override var value: Float {
    set {
      super.value = newValue
    }
    
    get {
      return round(super.value * 1.0) / 1.0
    }
  }
}
