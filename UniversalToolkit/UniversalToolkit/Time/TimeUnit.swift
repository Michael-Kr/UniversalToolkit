//
//  Int+Date=Love.swift
//  UniversalToolkit
//
//  Created by Michael Krutoyarskiy on 02/02/2020.
//  Copyright © 2020 Michael Krutoyarskiy. All rights reserved.
//

import Foundation
import UIKit

public extension Int {
  var milliseconds: TimeUnit { Double(self).milliseconds }
  var seconds: TimeUnit { Double(self).seconds }
  var minutes: TimeUnit { Double(self).minutes }
  var hours: TimeUnit { Double(self).hours }
  var days: TimeUnit { Double(self).days }
  var weeks: TimeUnit { Double(self).weeks }
}

public extension Double {
  var milliseconds: TimeUnit { .milliseconds(self) }
  var seconds: TimeUnit { .seconds(self) }
  var minutes: TimeUnit { .minutes(self) }
  var hours: TimeUnit { .hours(self) }
  var days: TimeUnit { .days(self) }
  var weeks: TimeUnit { .days(self * 7) }
}

public enum TimeUnit {
    case days(_ count: Double)
    case hours(_ count: Double)
    case minutes(_ count: Double)
    case seconds(_ count: Double)
    case milliseconds(_ count: Double)

    public static func +(lhs: Self, rhs: Self) -> TimeUnit {
        return .seconds(lhs.asSeconds + rhs.asSeconds)
    }

    public static func -(lhs: Self, rhs: Self) -> TimeUnit {
        return .seconds(lhs.asSeconds - rhs.asSeconds)
    }

    public var ago: Date { Date().addingTimeInterval(-self.asSeconds) }

    public var ahead: Date { Date().addingTimeInterval(self.asSeconds) }

    // one ugly naming...
    public var dtAhead: DispatchTime { DispatchTime.now() + self.asSeconds }

    public var asTimeInterval: TimeInterval { TimeInterval(asSeconds) }

    private var asSeconds: Double {
        switch self {
        case .milliseconds(let count):
            return count/1000
        case .seconds(let count):
            return count
        case .minutes(let count):
            return count * 60
        case .hours(let count):
            return count * 60 * 60
        case .days(let count):
            return count * 60 * 60 * 24
        }
    }
}
