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
    var period: Int // 0 = break, n = period (1,2,0,3,4,0,5)
    var type: String // class or break
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
    
    //@Published public var userBaseDayStructure = [Subject]()
    
    @Published public var userBaseDayStructure : [Subject] = [ // TESTING VARIABLE
        Subject(period: 1, type: "class", startTime: getDate("08:45"), endTime: getDate("09:45")),
        Subject(period: 2, type: "class", startTime: getDate("09:45"), endTime: getDate("10:45")),
        Subject(period: 0, type: "break", startTime: getDate("10:45"), endTime: getDate("11:15")),
        Subject(period: 3, type: "class", startTime: getDate("11:15"), endTime: getDate("12:15")),
        Subject(period: 4, type: "class", startTime: getDate("12:15"), endTime: getDate("13:15")),
        Subject(period: 0, type: "break", startTime: getDate("13:15"), endTime: getDate("14:00")),
        Subject(period: 5, type: "class", startTime: getDate("14:30"), endTime: getDate("15:30")),
    ]
    
    
    // all the classes that have overrides
    // ["day", "period", "class or break", "start time", "end time"]
    
    public struct OverDayStructure {
        var day: Int
        var classes: [Subject]
    }
    
    public var userOverrideStructures = [OverDayStructure]()
}
