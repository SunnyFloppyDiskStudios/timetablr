//
//  DataController.swift
//  timetablr
//
//  Created on 23/04/2026.
//
//  File which stores/saves/loads data

// monday is 1 .. sunday is 7

import Foundation

// subjects

// subjects that user has
public var userSubjects = [String]()

// the subjects that a user has on a day
// ["class1", "class2", "etc."]
public var userSetSubjects = [[String]]()

// structures

// default structure that days will follow
// ["period", "class or break", "start time", "end time"]

//public var userBaseStructure = [[Any]]()

public var userBaseStructure : [[String]] = [
    ["1", "class", "2000-01-01 08:45:00 +0000", "2000-01-01 09:45:00 +0000"],
    ["2", "class", "2000-01-01 09:45:00 +0000", "2000-01-01 10:45:00 +0000"],
    ["0", "break", "2000-01-01 10:45:00 +0000", "2000-01-01 11:15:00 +0000"],
    ["3", "class", "2000-01-01 11:15:00 +0000", "2000-01-01 12:15:00 +0000"],
    ["4", "class", "2000-01-01 12:15:00 +0000", "2000-01-01 13:15:00 +0000"],
    ["0", "break", "2000-01-01 13:15:00 +0000", "2000-01-01 14:00:00 +0000"],
    ["5", "class", "2000-01-01 14:30:00 +0000", "2000-01-01 15:30:00 +0000"],
]


// all the classes that have overrides
// ["day", "period", "class or break", "start time", "end time"]
public var userOverrideStructures = [[String]]()


