//
//  HelperController.swift
//  timetablr
//
//  Created on 24/04/2026.
//
//  Contains helper functions and variables that have no other logical home

import Foundation

//MARK: - variables
public struct Time {
    var hours: Int
    var minutes: Int
}

//MARK: - functions
/// Convert string Date to Date() type (mainly for debugging)
public func getDateFromString(_ dateString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    
    print(dateFormatter.date(from: dateString) ?? Date())
    
    return dateFormatter.date(from: dateString) ?? Date()
}
