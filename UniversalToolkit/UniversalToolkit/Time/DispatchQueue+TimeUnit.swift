//
//  DispatchQueue+TimeUnit.swift
//  UniversalToolkit
//
//  Created by Michael Krutoyarskiy on 03/02/2020.
//  Copyright © 2020 Michael Krutoyarskiy. All rights reserved.
//

import Foundation

extension DispatchQueue {
    public func asyncAfter(_ timeUnit: TimeUnit, qos: DispatchQoS = .unspecified, flags: DispatchWorkItemFlags = [], execute work: @escaping @convention(block) () -> Void) {
        asyncAfter(deadline: timeUnit.dtAhead, qos: qos, flags: flags, execute: work)
    }

    public func asyncAfter(_ timeUnit: TimeUnit, execute workItem: DispatchWorkItem) {
        asyncAfter(deadline: timeUnit.dtAhead, execute: workItem)
    }
}
