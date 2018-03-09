//
//  DateEvent.swift
//  countdown
//
//  Created by Steven McCracken on 12/19/17.
//  Copyright © 2017 steve. All rights reserved.
//

import Foundation

class DateEvent {
  
  var date: Date
  var title: String
  
  /**
   Creates a date event.
   - Parameter date: the date that the event occurs on
   - Parameter title: the event title
   - Returns: the object
   */
  init(date: Date, title: String) {
    self.date = date
    self.title = title
  }
  
  /**
   Creates a date event from a given UNIX timestamp in seconds.
   - Parameter timestamp: the number of seconds since January 1st, 1970, 00:00:00 UTC
   - Parameter title: the title of the date event
   - Returns: the object
   */
  convenience init(timestamp milliseconds: Int, title: String) {
    let interval = TimeInterval(milliseconds)
    let date = Date(timeIntervalSince1970: interval)
    self.init(date: date, title: title)
  }
}
