//
//  TimeManager.swift
//  countdown
//
//  Created by Steven McCracken on 3/3/18.
//  Copyright © 2018 steve. All rights reserved.
//

import Foundation

class TimeManager {
  
  /**
   Singleton instance
   */
  static let shared = TimeManager()
  
  /**
   Timer that tracks the current date every second
   */
  private var timer: Timer?
  
  /**
   Publicly accessible event to receive current date updates
   */
  private(set) var timestampEvent: Event<Date>
  
  private init() {
    timestampEvent = Event<Date>()
    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
  }
  
  /**
   Handler for whenever the timer tracking the current date fires. Raises data about the current date to the event
   */
  @objc
  private func timerDidFire() {
    let currentDate = Date()
    print("Raising \(currentDate) to event handlers")
    timestampEvent.raise(data: currentDate)
  }
}
