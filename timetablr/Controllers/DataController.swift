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

public struct Time {
    var hours: Int
    var minutes: Int
}

// default structure that days will follow
public struct Subject {
    var period: Bool // false = break, true = period
    var startTime: Date
    var endTime: Date
}

public struct DayClass {
    var day: Int
    var classes: [String] // names
}


class DataController: ObservableObject {
    //MARK: - subjects
    
    // subjects that user has
    public var userSubjects = [String]()
    
    // the subjects that a user has on a day (an array of DayClass objects would order the classes of each day)
    public var userSetSubjects = [DayClass]()
    
    //MARK: - structures
    
    @Published public var userBaseDayStructure = [Subject]()
    
//    @Published public var userBaseDayStructure : [Subject] = [ // TESTING VARIABLE
//        Subject(period: true, startTime: dateFromString("08:45"), endTime: dateFromString("09:45")),
//        Subject(period: true, startTime: dateFromString("09:45"), endTime: dateFromString("10:45")),
//        Subject(period: false, startTime: dateFromString("10:45"), endTime: dateFromString("11:15")),
//        Subject(period: true, startTime: dateFromString("11:15"), endTime: dateFromString("12:15")),
//        Subject(period: true, startTime: dateFromString("12:15"), endTime: dateFromString("13:15")),
//        Subject(period: false, startTime: dateFromString("13:15"), endTime: dateFromString("14:00")),
//        Subject(period: true, startTime: dateFromString("14:30"), endTime: dateFromString("15:30")),
//    ]
    
    
    // all the classes that have overrides
    // ["day", "period", "class or break", "start time", "end time"]
    
    public struct OverDayStructure {
        var day: Int
        var classes: [Subject]
    }
    
    public var userOverrideStructures = [OverDayStructure]()
}
