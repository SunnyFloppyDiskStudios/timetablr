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
    var isPeriod: Bool // false = break, true = period
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
    
    // all the classes that have overrides
    // ["day", "period", "class or break", "start time", "end time"]
    
    public struct OverDayStructure {
        var day: Int
        var classes: [Subject]
    }
    
    public var userOverrideStructures = [OverDayStructure]()
}
