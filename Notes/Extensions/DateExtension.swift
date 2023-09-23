//
//  DateExtension.swift
//  Notes
//
//  Created by OITD on 23/09/23.
//

import Foundation

public extension Date {
    var iso8601String: String {
        Formatter.iso8601withFractionalSeconds.string(from: self)
    }
}
