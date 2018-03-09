//
//  EventTableViewCell.swift
//  countdown
//
//  Created by Steven McCracken on 3/3/18.
//  Copyright © 2018 steve. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
  
  static let identifier = "EventTableViewCell"
  
  @IBOutlet weak var slider: SnappingUISlider!
  @IBOutlet weak var valueStackView: UIStackView!
  @IBOutlet weak var iconImageView: UIImageView!
  
  // Static labels
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLabel: UILabel!
  
  // Indicator labels
  @IBOutlet weak var yearsLabel: UILabel!
  @IBOutlet weak var monthsLabel: UILabel!
  @IBOutlet weak var weeksLabel: UILabel!
  @IBOutlet weak var daysLabel: UILabel!
  @IBOutlet weak var hoursLabel: UILabel!
  @IBOutlet weak var minutesLabel: UILabel!
  @IBOutlet weak var secondsLabel: UILabel!
  
  // Value labels
  @IBOutlet weak var yearsValueLabel: UILabel!
  @IBOutlet weak var monthsValueLabel: UILabel!
  @IBOutlet weak var weeksValueLabel: UILabel!
  @IBOutlet weak var daysValueLabel: UILabel!
  @IBOutlet weak var hoursValueLabel: UILabel!
  @IBOutlet weak var minutesValueLabel: UILabel!
  @IBOutlet weak var secondsValueLabel: UILabel!
  
  private var event: DateEvent!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    let view = UIView()
    view.backgroundColor = .lightBlue
    selectedBackgroundView = view
    toggleLabels(forValue: slider.value)
  }
  
  func addEvent(_ event: DateEvent) {
    self.event = event
    titleLabel.text = event.title
    
    let formatter = DateFormatter()
    formatter.timeStyle = .medium
    formatter.dateStyle = .medium
    dateLabel.text = formatter.string(from: event.date)
    updateStatusLabel(forDate: Date())
  }
  
  func updateCountdown(with date: Date) {
    updateStatusLabel(forDate: date)
    let currentValue = slider.value
    let seconds = date.seconds(from: event.date)
    secondsValueLabel.text = "\(abs(currentValue == 0 ? seconds : seconds % 60))"
    
    let minutes = date.minutes(from: event.date)
    minutesValueLabel.text = "\(abs(currentValue == 1 ? minutes : minutes % 60))"
    
    let hours = date.hours(from: event.date)
    hoursValueLabel.text = "\(abs(currentValue == 2 ? hours : hours % 24))"
    
    let days = date.days(from: event.date)
    daysValueLabel.text = "\(abs(currentValue == 3 ? days : days % 7))"
    
    let weeks = date.weeks(from: event.date)
    weeksValueLabel.text = "\(abs(currentValue == 4 ? weeks : weeks % 4))"
    
    let months = date.months(from: event.date)
    monthsValueLabel.text = "\(abs(currentValue == 5 ? months : months % 12))"
    
    yearsValueLabel.text = "\(abs(date.years(from: event.date)))"
  }
  
  @IBAction func sliderValueDidChange(_ sender: SnappingUISlider) {
    toggleLabels(forValue: sender.value)
    updateCountdown(with: Date())
  }
  
  private func toggleLabels(forValue value: Float) {
    minutesLabel.isHidden = value < 1
    minutesValueLabel.isHidden = value < 1
    
    hoursLabel.isHidden = value < 2
    hoursValueLabel.isHidden = value < 2
    
    daysLabel.isHidden = value < 3
    daysValueLabel.isHidden = value < 3
    
    weeksLabel.isHidden = value < 4
    weeksValueLabel.isHidden = value < 4
    
    monthsLabel.isHidden = value < 5
    monthsValueLabel.isHidden = value < 5
    
    yearsLabel.isHidden = value < 6
    yearsValueLabel.isHidden = value < 6
  }
  
  private func updateStatusLabel(forDate date: Date) {
    iconImageView.image = UIImage(named: date > event.date ? .checkmark : .clock)
  }
}
