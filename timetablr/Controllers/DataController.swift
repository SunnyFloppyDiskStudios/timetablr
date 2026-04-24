//
//  DataController.swift
//  timetablr
//
//  Created on 23/04/2026.
//
//  File which stores/saves/loads data

// monday is 1 .. sunday is 7

import Foundation
import SwiftUI
import Combine

class DataController: ObservableObject {
    //MARK: - subjects
    
    // subjects that user has
    public var userSubjects = [String]()
    
    // the subjects that a user has on a day (an array of DayClass objects would order the classes of each day)
    public struct DayClass {
        var day: Int
        var classes: [String] // names
    }
    
    public var userSetSubjects = [DayClass]()
    
    //MARK: - structures
    
    // default structure that days will follow
    public struct Subject {
        var period: Int // 0 = break, n = period (1,2,0,3,4,0,5)
        var type: String // class or break
        var startTime: Date
        var endTime: Date
    }
    
    public struct Time {
        var hours: Int
        var minutes: Int
    }
    
    //@Published public var userBaseDayStructure = [Subject]()
    
    @Published public var userBaseDayStructure : [Subject] = [ // TESTING VARIABLE
        Subject(period: 1, type: "class", startTime: getDate("2000-01-01 08:45:00 +0000")!, endTime: getDate("2000-01-01 09:45:00 +0000")!),
        Subject(period: 2, type: "class", startTime: getDate("2000-01-01 09:45:00 +0000")!, endTime: getDate("2000-01-01 10:45:00 +0000")!),
        Subject(period: 0, type: "break", startTime: getDate("2000-01-01 10:45:00 +0000")!, endTime: getDate("2000-01-01 11:15:00 +0000")!),
        Subject(period: 3, type: "class", startTime: getDate("2000-01-01 11:15:00 +0000")!, endTime: getDate("2000-01-01 12:15:00 +0000")!),
        Subject(period: 4, type: "class", startTime: getDate("2000-01-01 12:15:00 +0000")!, endTime: getDate("2000-01-01 13:15:00 +0000")!),
        Subject(period: 0, type: "break", startTime: getDate("2000-01-01 13:15:00 +0000")!, endTime: getDate("2000-01-01 14:00:00 +0000")!),
        Subject(period: 5, type: "class", startTime: getDate("2000-01-01 14:30:00 +0000")!, endTime: getDate("2000-01-01 15:30:00 +0000")!),
    ]
    
    
    // all the classes that have overrides
    // ["day", "period", "class or break", "start time", "end time"]
    
    public struct OverDayStructure {
        var day: Int
        var classes: [Subject]
    }
    
    public var userOverrideStructures = [OverDayStructure]()
}
