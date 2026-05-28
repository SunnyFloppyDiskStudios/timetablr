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

//MARK: - structs
public struct Period { // period is for structure
    var isPeriod: Bool // false = break, true = period
    var startTime: Date
    var endTime: Date
}

public struct Subject { // subject is for class
    var name: String
    var colour: Color
}

public struct DayStructure {
    var day: Int
    var classes: [String] // names
}

public struct OverridenDayStructure {
    var day: Int
    var classes: [Period]
}

class DataController: ObservableObject {
    //MARK: - variables
    
    // subjects that user has
    @Published public var userSubjects = [Subject]()
    
    // the subjects that a user has on a day (an array of DayClass objects would order the classes of each day)
    @Published public var userSetSubjects = [DayStructure]()
    
    // structure for normal days
    @Published public var userBaseDayStructure = [Period]()
    
    // all the classes that have overrides
    // ["day", "period", "class or break", "start time", "end time"]
    @Published public var userOverrideStructures = [OverridenDayStructure]()
}
