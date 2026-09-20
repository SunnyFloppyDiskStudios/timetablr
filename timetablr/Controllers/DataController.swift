//
//  DataController.swift
//  timetablr
//
//  Created on 23/04/2026.
//
//  File which stores/saves/loads data

import Foundation
import SwiftUI
import Combine

//MARK: - structs

/// Some class or break in a timetable day. Used in structures and classes will conform to these periods.
public struct Period: Codable {
    public var id = UUID()
    var isPeriod: Bool // false = break, true = period
    var startTime: Time
    var endTime: Time
    
    init(isPeriod: Bool, startTime: Time, endTime: Time) {
        self.id = UUID()
        self.isPeriod = isPeriod
        self.startTime = startTime
        self.endTime = endTime
    }
}

/// Defines a class that a user has, i.e. Math
public struct Subject: Identifiable, Codable {
    public var id = UUID()
    var name: String
    var colour: Color // does not identify as Codable
    
    init(name: String, colour: Color) {
        self.id = UUID()
        self.name = name
        self.colour = colour
    }
    
    // helpers to allow Colour to be encoded/decoded
    // breaks down Color type into its components
    enum CodingKeys: String, CodingKey {
        case id, name, colour
    }
    
    // function that gets called when a Subject is being initialised, decoder
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self) // the data itself

        id = try container.decode(UUID.self, forKey: .id)
        
        name = try container.decode(String.self, forKey: .name)

        let colourData = try container.decode(Data.self, forKey: .colour)
        colour = try NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: colourData).map(Color.init) ?? .clear // turns Data object into UIColor (fallback if fail)
    }
    
    // function that allows Color to be codable
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)

        let colourData = try NSKeyedArchiver.archivedData(withRootObject: UIColor(colour), requiringSecureCoding: true)
        try container.encode(colourData, forKey: .colour)
    }
}

/// Defines a lesson with relevant information
public struct Class: Codable {
    var periodID: UUID
    var subject: Subject
}

/// A special timetable structure that might be used on days with different timetable structures. Requires setting a specific day and list of periods.
public struct OverridenDayStructure: Codable {
    var day: Int
    var classes: [Period]
}

/// The subjects a user has in a day, in order of when they occur
public struct DaySubjects: Codable {
    var day: Int
    var subjects: [Class]
}

/// Naming index full
public let days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]

/// Naming index characters
public let daysChars = ["Mo", "Tu", "We", "Th", "Fr", "Sa", "Su"]

/// Controller for managing user data. Contains mutable user data. Default state is empty.
class DataController: ObservableObject {
    //MARK: - variables
    
    /// Array of classes that a user has.
    @Published public var userSubjects = [Subject]()
    
    /// Array of periods that a user has on a day. This is the normal timetable structure
    @Published public var userBaseDayStructure = [Period]()
    
    /// Array of overridden timetable structures
    @Published public var userOverrideDayStructures = [OverridenDayStructure]()
    
    /// List of days the user wishes to display. true or false, in order of monday-sunday
    @Published public var displayDays = [Bool]()
    
    /// Array of days with classes for the user to attend
    @Published public var userDaySubjects = [DaySubjects]()
    
    // MARK: - save data management
    // note, this code has to be here because it needs to access above variables. Otherwise it would normally get it's own helper file.
    
    private var cancellables = Set<AnyCancellable>() // stores the "subscriptions" to each data point.

    /// Struct containing the data that needs to be saved from this manager
    private struct SavedData: Codable {
        var userSubjects: [Subject]
        var userBaseDayStructure: [Period]
        var userOverrideDayStructures: [OverridenDayStructure]
        var displayDays: [Bool]
        var userDaySubjects: [DaySubjects]
    }
    
    /// Saves data into JSON format
    private func save() {
        let savedData = SavedData(
            userSubjects: userSubjects,
            userBaseDayStructure: userBaseDayStructure,
            userOverrideDayStructures: userOverrideDayStructures,
            displayDays: displayDays,
            userDaySubjects: userDaySubjects
        )

        do {
            let folder = saveURL.deletingLastPathComponent()
            try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)

            let data = try JSONEncoder().encode(savedData)
            try data.write(to: saveURL)
        } catch {
            print("Failed to save: \(error)")
        }
    }

    /// Decodes JSON and loads save data when called
    private func load() {
        do {
            let data = try Data(contentsOf: saveURL)
            let savedData = try JSONDecoder().decode(SavedData.self, from: data)

            userSubjects = savedData.userSubjects
            userBaseDayStructure = savedData.userBaseDayStructure
            userOverrideDayStructures = savedData.userOverrideDayStructures
            displayDays = savedData.displayDays
            userDaySubjects = savedData.userDaySubjects
        } catch {
            print("No saved data found")
        }
    }
    
    // MARK: - init
    init() {
        // default state
        displayDays = [true,true,true,true,true,false,false]
        
        // load save data
        
        load()

        $userSubjects
            .dropFirst()
            .sink { [weak self] _ in self?.save() }
            .store(in: &cancellables)

        $userBaseDayStructure
            .dropFirst()
            .sink { [weak self] _ in self?.save() }
            .store(in: &cancellables)

        $userOverrideDayStructures
            .dropFirst()
            .sink { [weak self] _ in self?.save() }
            .store(in: &cancellables)

        $displayDays
            .dropFirst()
            .sink { [weak self] _ in self?.save() }
            .store(in: &cancellables)

        $userDaySubjects
            .dropFirst()
            .sink { [weak self] _ in self?.save() }
            .store(in: &cancellables)
    }
}
