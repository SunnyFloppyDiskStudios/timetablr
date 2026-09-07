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
    /// Variable to control store whether the user has finished the setup
    @Published var setupComplete: Bool
    
    /// Variable to control whether the user is editing their timetable
    @Published var tTableEditMode: Bool
    
    
    init() {
        tTableEditMode = false
        setupComplete = false
    }
}
