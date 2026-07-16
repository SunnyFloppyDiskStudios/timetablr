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
/// Some class or break in a timetable day. Used in structures and classes will conform to these periods.
public struct Period {
    var isPeriod: Bool // false = break, true = period
    var startTime: Date
    var endTime: Date
}

/// Defines a class that a user has, i.e. Math
public struct Subject {
    var name: String
    var colour: Color
}

/// Defines a lesson with relevant information
public struct Class {
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

/// Controller for managing user data
class DataController: ObservableObject {
    //MARK: - variables
    
    /// Array of classes that a user has.
    @Published public var userSubjects = [Subject]()
    
    /// Array of subjects that a user has on a day. This is the normal timetable structure
    @Published public var userBaseDayStructure = [Period]()
    
    /// Array of overridden timetable structures
    @Published public var userOverrideStructures = [OverridenDayStructure]()
    
    /// List of days the user wishes to display
    @Published public var displayDays: [Int] = [1,2,3,4,5,6,7] // 1 - 7 based on monday - sunday
    public let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    
    /// Array of days with classes for the user to attend
    @Published public var userDaySubjects: [DaySubjects] = [DaySubjects.init(day: 1, subjects: [Class]()), DaySubjects.init(day: 2, subjects: [Class]()), DaySubjects.init(day: 3, subjects: [Class]()), DaySubjects.init(day: 4, subjects: [Class]()), DaySubjects.init(day: 5, subjects: [Class]()), DaySubjects.init(day: 6, subjects: [Class]()), DaySubjects.init(day: 7, subjects: [Class]())]
}
