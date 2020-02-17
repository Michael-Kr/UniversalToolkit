//
//  UNNotificationTrigger+TimeUnit.swift
//  UniversalToolkit
//
//  Created by Michael Krutoyarskiy on 03/02/2020.
//  Copyright © 2020 Michael Krutoyarskiy. All rights reserved.
//

import Foundation
import UserNotifications

extension UNTimeIntervalNotificationTrigger {
    convenience public init(timeUnit: TimeUnit, repeats: Bool) {
        self.init(timeInterval: timeUnit.asTimeInterval, repeats: repeats)
    }
}

