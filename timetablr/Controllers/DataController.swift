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

/// A special timetable structure that might be used on days with different timetable structures. Requires setting a specific day and list of periods.
public struct OverridenDayStructure {
    var day: Int
    var classes: [Period]
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
}
