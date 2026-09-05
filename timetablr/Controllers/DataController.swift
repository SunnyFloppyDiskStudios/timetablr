//
//  DataController.swift
//  timetablr
//
//  Created on 23/04/2026.
//
//  File which stores/saves/loads data

// monday is 0 .. sunday is 6

import Foundation
import SwiftUI
import Combine

//MARK: - structs
/// Some class or break in a timetable day. Used in structures and classes will conform to these periods.
public struct Period {
    var isPeriod: Bool // false = break, true = period
    var startTime: Time
    var endTime: Time
}

/// Defines a class that a user has, i.e. Math
public struct Subject {
    var name: String
    var colour: Color
}

/// Defines a lesson with relevant information
public struct Class {
    var period: Int
    var subject: Subject
}

/// A special timetable structure that might be used on days with different timetable structures. Requires setting a specific day and list of periods.
public struct OverridenDayStructure {
    var day: Int
    var classes: [Period]
}

/// The subjects a user has in a day, in order of when they occur
public struct DaySubjects {
    var day: Int
    var subjects: [Class]
}

/// Naming index
public let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

/// Controller for managing user data. Contains mutable user data.
class DataController: ObservableObject {
    //MARK: - variables
    
    /// Array of classes that a user has.
    @Published public var userSubjects = [Subject]()                                            // unset
    
    /// Array of periods that a user has on a day. This is the normal timetable structure
    @Published public var userBaseDayStructure = [Period]()
    
    /// Array of overridden timetable structures
    @Published public var userOverrideStructures = [OverridenDayStructure]()                    // unset
    
    /// List of days the user wishes to display. 1 - 7 based on monday - sunday
    @Published public var displayDays: [Int] = [1,2,3,4,5,6,7]
    
    /// Array of days with classes for the user to attend
    @Published public var userDaySubjects = [DaySubjects]()
    
    
    
    
    
    
    
    
    
    
    init() {
        // DEBUG DATA!!!! DELETE IN PRODUCTION !!!!
        
        userDaySubjects.append(DaySubjects.init(day: 0, subjects: [
            Class.init(period: 0, subject: Subject.init(name: "Test1", colour: .red)),
            Class.init(period: 1, subject: Subject.init(name: "Test2", colour: .blue)),
            Class.init(period: 3, subject: Subject.init(name: "Test3", colour: .green)),
            Class.init(period: 4, subject: Subject.init(name: "Test4", colour: .red)),
            Class.init(period: 6, subject: Subject.init(name: "Test5", colour: .yellow)),
        ]))
        
        userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Time(hours: 8, minutes: 45), endTime: Time(hours: 9, minutes: 45)))
        userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Time(hours: 9, minutes: 45), endTime: Time(hours: 10, minutes: 45)))
        userBaseDayStructure.append(Period.init(isPeriod: false, startTime: Time(hours: 10, minutes: 45), endTime: Time(hours: 11, minutes: 15)))
        userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Time(hours: 11, minutes: 15), endTime: Time(hours: 12, minutes: 15)))
        userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Time(hours: 12, minutes: 15), endTime: Time(hours: 13, minutes: 15)))
        userBaseDayStructure.append(Period.init(isPeriod: false, startTime: Time(hours: 13, minutes: 15), endTime: Time(hours: 14, minutes: 00)))
        userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Time(hours: 14, minutes: 30), endTime: Time(hours: 15, minutes: 30)))
    }
}
