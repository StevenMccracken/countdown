//
//  MockEvents.swift
//  countdown
//
//  Created by Steven McCracken on 12/19/17.
//  Copyright © 2017 steve. All rights reserved.
//

import Foundation

class MockEvents {
  
  static var events: [DateEvent] {
    let secondsPerDay = 86400
    let dec192017 = 1513800000
    let event1 = DateEvent(date: Date(timeIntervalSince1970: TimeInterval(dec192017)), title: "Event 1")
    let event2 = DateEvent(date: Date(timeIntervalSince1970: TimeInterval(dec192017 + secondsPerDay)), title: "Event 2")
    let event3 = DateEvent(date: Date(timeIntervalSince1970: TimeInterval(dec192017 + secondsPerDay * 2)), title: "Event 3")
    let event4 = DateEvent(date: Date(timeIntervalSince1970: TimeInterval(dec192017 + secondsPerDay * 3)), title: "Event 4")
    let event5 = DateEvent(date: Date(timeIntervalSince1970: TimeInterval(dec192017 + secondsPerDay * 4)), title: "Event 5")
    let event6 = DateEvent(date: Date(timeIntervalSince1970: TimeInterval(dec192017 + secondsPerDay * 5)), title: "Event 6")
    let event7 = DateEvent(timestamp: 1681026611, title: "Crazy party time👌🏽")

    return [event7, event1, event2, event3, event4, event5, event6]
  }
}
