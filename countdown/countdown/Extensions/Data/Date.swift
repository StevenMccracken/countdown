//
//  Date.swift
//  countdown
//
//  Created by Steven McCracken on 3/3/18.
//  Copyright © 2018 steve. All rights reserved.
//

import Foundation

extension Date {
  
  /**
   Calculates the number of years from a given date.
   - Parameter date: the reference date
   - Returns: the number of years from the given date
   */
  func years(from date: Date) -> Int {
    return Calendar.current.dateComponents([.year], from: date, to: self).year ?? 0
  }
  
  /**
   Calculates the number of months from a given date.
   - Parameter date: the reference date
   - Returns: the number of months from the given date
   */
  func months(from date: Date) -> Int {
    return Calendar.current.dateComponents([.month], from: date, to: self).month ?? 0
  }
  
  /**
   Calculates the number of weeks from a given date.
   - Parameter date: the reference date
   - Returns: the number of weeks from the given date
   */
  func weeks(from date: Date) -> Int {
    return Calendar.current.dateComponents([.weekOfMonth], from: date, to: self).weekOfMonth ?? 0
  }
  
  /**
   Calculates the number of days from a given date.
   - Parameter date: the reference date
   - Returns: the number of days from the given date
   */
  func days(from date: Date) -> Int {
    return Calendar.current.dateComponents([.day], from: date, to: self).day ?? 0
  }
  
  /**
   Calculates the number of hours from a given date.
   - Parameter date: the reference date
   - Returns: the number of hours from the given date
   */
  func hours(from date: Date) -> Int {
    return Calendar.current.dateComponents([.hour], from: date, to: self).hour ?? 0
  }
  
  /**
   Calculates the number of minutes from a given date.
   - Parameter date: the reference date
   - Returns: the number of minutes from the given date
   */
  func minutes(from date: Date) -> Int {
    return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
  }
  
  /**
   Calculates the number of seconds from a given date.
   - Parameter date: the reference date
   - Returns: the number of seconds from the given date
   */
  func seconds(from date: Date) -> Int {
    return Calendar.current.dateComponents([.second], from: date, to: self).second ?? 0
  }
}
