//
//  AddEventViewController.swift
//  countdown
//
//  Created by Steven McCracken on 3/14/18.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Configure navigation bar
    navigationController?.addDoneButton(side: .right, withAction: #selector(didTapDoneButton(_:)), target: self)
    
    // Configure table view
    tableView.register(UINib(nibName: AddEventTitleTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: AddEventTitleTableViewCell.identifier)
  }
}

extension AddEventViewController {
  
  @objc
  func didTapDoneButton(_ sender: UIBarButtonItem) {
    dismiss(animated: true)
  }
}

extension AddEventViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cell: UITableViewCell
    switch indexPath.section {
    case 0:
      cell = configureAddTitleCell(tableView, indexPath: indexPath) ?? UITableViewCell()
    default:
      cell = UITableViewCell()
    }
    
    return cell
  }
}

extension AddEventViewController {
  
  private func configureAddTitleCell(_ tableView: UITableView, indexPath: IndexPath) -> AddEventTitleTableViewCell? {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: AddEventTitleTableViewCell.identifier, for: indexPath) as? AddEventTitleTableViewCell else {
      return nil
    }
    
    return cell
  }
}
