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
public struct Period {
    var isPeriod: Bool // false = break, true = period
    var startTime: Date
    var endTime: Date
}

public struct DayClass {
    var day: Int
    var classes: [String] // names
}

public struct Subject {
    var name: String
    var colour: Color
}


class DataController: ObservableObject {
    //MARK: - subjects
    
    // subjects that user has
    @Published public var userSubjects = [Subject]()
    
    // the subjects that a user has on a day (an array of DayClass objects would order the classes of each day)
    @Published public var userSetSubjects = [DayClass]()
    
    //MARK: - structures
    
    @Published public var userBaseDayStructure = [Period]()
    
    // all the classes that have overrides
    // ["day", "period", "class or break", "start time", "end time"]
    
    public struct OverDayStructure {
        var day: Int
        var classes: [Period]
    }
    
    @Published public var userOverrideStructures = [OverDayStructure]()
}
