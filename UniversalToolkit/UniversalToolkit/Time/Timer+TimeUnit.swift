//
//  Timer+TimeUnit.swift
//  UniversalToolkit
//
//  Created by Michael Krutoyarskiy on 03/02/2020.
//  Copyright © 2020 Michael Krutoyarskiy. All rights reserved.
//

import Foundation

extension Timer {
    public class func scheduledTimer(withTimeUnit timeUnit: TimeUnit, repeats: Bool, block: @escaping (Timer) -> Void) -> Timer {
        Timer.scheduledTimer(withTimeInterval: timeUnit.asTimeInterval, repeats: repeats, block: block)
    }
}
