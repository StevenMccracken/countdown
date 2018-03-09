//
//  Event.swift
//  countdown
//
//  Created by Steven McCracken on 3/3/18.
//  Copyright © 2018 steve. All rights reserved.
//

import Foundation

public class Event<T> {
  
  public typealias EventHandler = (T) -> ()
  fileprivate var handlers = [Invocable]()
  
  public func raise(data: T) {
    for handler in handlers {
      handler.invoke(data: data)
    }
  }
  
  public func addHandler<U: AnyObject>(target: U, handler: @escaping (U) -> EventHandler) -> Disposable {
    let wrapper = EventHandlerWrapper(target: target, handler: handler, event: self)
    handlers.append(wrapper)
    return wrapper
  }
}

private class EventHandlerWrapper<T: AnyObject, U>: Invocable, Disposable {
  
  weak var target: T?
  let handler: (T) -> (U) -> ()
  let event: Event<U>
  
  init(target: T?, handler: @escaping (T) -> (U) -> (), event: Event<U>) {
    self.event = event
    self.target = target
    self.handler = handler
  }
  
  func invoke(data: Any) {
    guard let target = target else {
      return
    }
    
    handler(target)(data as! U)
  }
  
  func dispose() {
    event.handlers = event.handlers.filter { $0 !== self }
  }
}

private protocol Invocable: class {
  func invoke(data: Any)
}

public protocol Disposable {
  func dispose()
}
