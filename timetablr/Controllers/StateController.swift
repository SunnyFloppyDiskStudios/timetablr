//
//  StateController.swift
//  timetablr
//
//  Created on 07/09/2026.
//
//  File for controlling app state variables, such as edit/setup modes

import Foundation
import Combine
import SwiftUI

class StateController: ObservableObject {
    // MARK: - variables
    
    /// Variable to control store whether the user has finished the setup
    @Published var setupComplete: Bool
    
    /// Variable to control whether the user is editing their timetable
    @Published var tTableEditMode: Bool
    
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - init
    init() {
        // initial state
        tTableEditMode = false
        setupComplete = false
        
        // save data management
        
        if let saved = try? Data(contentsOf: setupURL),
           let value = String(data: saved, encoding: .utf8) {
            setupComplete = value == "true"
        } else {
            setupComplete = false
        }

        $setupComplete
            .dropFirst()
            .sink { [weak self] value in
                self?.saveSetupComplete(value)
            }
            .store(in: &cancellables)
    }
    
    // MARK: - save data management
    
    /// Saves the setup complete variable
    /// - Parameter value: Whether setup is complete. (Bool)
    private func saveSetupComplete(_ value: Bool) {
        let folder = setupURL.deletingLastPathComponent()

        do {
            try FileManager.default.createDirectory(at: folder, withIntermediateDirectories: true)
            try Data(value.description.utf8).write(to: setupURL)
        } catch {
            print("Failed to save setup state: \(error)")
        }
    }
}
