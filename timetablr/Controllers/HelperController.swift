//
//  HelperController.swift
//  timetablr
//
//  Created on 24/04/2026.
//
//  Contains generic functions and variables

import Foundation

//MARK: - structs

public struct Time: Codable {
    var hours: Int
    var minutes: Int
}

//MARK: - functions

/// Convert string Date to Date() type (mainly for debugging)
/// 
/// - Parameter dateString: An object of type Date that was parsed into a string. (String)
/// - Returns: A Date object from the saved string. (Date)
public func getDateFromString(_ dateString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    
    print(dateFormatter.date(from: dateString) ?? Date())
    
    return dateFormatter.date(from: dateString) ?? Date()
}
/// Resets ALL app data
public func resetApp() {
    try? FileManager.default.removeItem(at: saveURL)
    try? FileManager.default.removeItem(at: setupURL)
}

//MARK: - helper variables

/// Naming index full
public let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

/// Naming index characters
public let daysChars = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]

/// Week index characters
public let weekChars = ["A", "B", "C", "D", "E"]

// get the iOS safe save URL
// datacontroller
public var saveURL: URL {
    FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        .appendingPathComponent("timetablr.json")
}

// statecontroller
public var setupURL: URL {
    FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
        .appendingPathComponent("setupComplete")
}
