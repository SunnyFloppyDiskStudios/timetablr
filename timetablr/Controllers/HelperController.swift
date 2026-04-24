//
//  HelperController.swift
//  timetablr
//
//  Created on 24/04/2026.
//
//  Contains helper functions and variables that have no other logical home

import Foundation

// Convert string Date to Date() type
public func getDate(_ dateString: String) -> Date? {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss Z"
    dateFormatter.timeZone = .current
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    return dateFormatter.date(from: dateString)
}
