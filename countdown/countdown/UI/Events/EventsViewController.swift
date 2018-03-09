//
//  EventsViewController.swift
//  countdown
//
//  Created by Steven McCracken on 3/3/18.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit

class EventsViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  /**
   Data source
   */
  var events = [DateEvent]()
  
  /**
   */
  private var timestampEventHandler: Disposable?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Configure table view
    events = MockEvents.events
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UINib(nibName: EventTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: EventTableViewCell.identifier)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // Subscribe to date updates
    timestampEventHandler = TimeManager.shared.timestampEvent.addHandler(target: self, handler: EventsViewController.timestampDidUpdate)
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    timestampEventHandler?.dispose()
  }
  
  private func timestampDidUpdate(_ date: Date) {
    DispatchQueue.main.async {
      for visibleCell in self.tableView.visibleCells {
        if let cell = visibleCell as? EventTableViewCell {
          cell.updateCountdown(with: date)
        }
      }
    }
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destinationViewController.
   // Pass the selected object to the new view controller.
   }
   */
}

extension EventsViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}

extension EventsViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return events.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier, for: indexPath) as? EventTableViewCell else {
      return EventTableViewCell()
    }
    
    cell.addEvent(events[indexPath.section])
    return cell
  }
}
