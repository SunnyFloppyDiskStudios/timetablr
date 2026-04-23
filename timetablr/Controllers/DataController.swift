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
// day : ["class1", "class2", "etc."]
public var userSetSubjects = [Int : [String]]()

// structures

// default structure that days will follow
// period : ["class or break", "start time", "end time"]
public var userBaseStructure = [Int : [String]]()

// all the classes that have overrides
// day : [period : ["class or break", "start time", "end time"]]
public var userOverrideStructures = [Int:[Int:[String]]]()


