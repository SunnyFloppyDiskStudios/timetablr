//
//  HelperController.swift
//  timetablr
//
//  Created on 24/04/2026.
//
//  Contains helper functions and variables that have no other logical home

import Foundation

// Convert string Date to Date() type
public func getDate(_ dateString: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "HH:mm"
    
    print(dateFormatter.date(from: String(format: "%02d%02d", dateString))!)
    
    return dateFormatter.date(from: String(format: "%02d%02d", dateString)) ?? Date()
}
