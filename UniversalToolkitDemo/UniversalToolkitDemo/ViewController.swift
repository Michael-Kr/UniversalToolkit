//
//  ViewController.swift
//  UniversalToolkitDemo
//
//  Created by Michael Krutoyarskiy on 02/02/2020.
//  Copyright © 2020 Odario. All rights reserved.
//

import UIKit
import UniversalToolkit
import UserNotifications


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let yesterday = 34.minutes.ago

        let dateInFuture = (5.days + 10.hours - 20.minutes + 325.milliseconds).ahead

        let dateInPast = (5.days + 10.hours - 20.minutes).ago

        let timer = Timer.scheduledTimer(withTimeUnit: 10.minutes, repeats: true) { (_) in

        }

        DispatchQueue.main.asyncAfter(10.seconds) {

        }

        DispatchQueue.main.asyncAfter(20.minutes, execute: DispatchWorkItem(block: {

        }))

        let intervalTrigger = UNTimeIntervalNotificationTrigger(timeUnit: 20.days, repeats: false)


        let dates: [Date] = [3.seconds.ago, 34.seconds.ago, 42.minutes.ago, 324.minutes.ago, 12.hours.ago, 24.hours.ago, 35.hours.ago, 23.hours.ahead]

        dates.forEach({
            print($0)
            print($0.relativelyFormatted)
            print("  ")
        })

    }

}

extension Date {
  var relativelyFormatted: String {
    let now = Date()

    let components = Calendar.current.dateComponents(
      [.day, .hour, .minute, .second],
      from: now,
      to: self
    )

    if let days = components.day {
        if days != 0 {
            let dateFormatter = DateFormatter()
            dateFormatter.doesRelativeDateFormatting = true
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: self)
        }
    }

    let formatter = DateComponentsFormatter()
    formatter.unitsStyle = .full
    formatter.allowsFractionalUnits = false
    formatter.includesApproximationPhrase = false
    formatter.includesTimeRemainingPhrase = false

    func ago() -> String { "\(formatter.string(from: abs(self.timeIntervalSinceNow)) ?? "") ago" }

    func ahead() -> String { "in \(formatter.string(from: abs(self.timeIntervalSinceNow)) ?? "")" }

    if let hours = components.hour {
        formatter.allowedUnits = [.hour]
        if hours > 0 {
            return ahead()
        } else if hours < 0 {
            return ago()
        }
    }

    if let minutes = components.minute {
      formatter.allowedUnits = [.minute]
       if minutes > 0 {
           return ahead()
       } else if minutes < 0 {
           return ago()
       }
    }

    if let seconds = components.second {
      formatter.allowedUnits = [.second]
      if seconds > 30 {
           return ahead()
       } else if seconds < -30 {
           return ago()
       }
    }

    return "just now"
  }
}
