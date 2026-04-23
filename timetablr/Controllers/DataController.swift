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
//public var userBaseStructure = [[String]]()

public var userBaseStructure : [[String]] = [
    ["1", "class", "", ""],
    ["2", "class", "", ""],
    ["0", "break", "", ""],
    ["3", "class", "", ""],
    ["4", "class", "", ""],
    ["0", "break", "", ""],
    ["5", "class", "", ""],
]


// all the classes that have overrides
// ["day", "period", "class or break", "start time", "end time"]]
public var userOverrideStructures = [[String]]()


