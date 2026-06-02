//
//  ColourController.swift
//  timetablr
//
//  Created on 28/05/2026.
//
//  helper file for ColourPopover

import Foundation
import Combine
import SwiftUI

/// Manages timetable colours for classes.
class ColourController: ObservableObject {
    // access shared data
    var data: DataController
    
    init(data: DataController) {
        self.data = data
    }
    
    // variables
    @Published var chosenColour: Color = Color.red
    
    @Published var isRecolouring: Bool = false
    @Published var colourTargetOnRecolour: Int = 0
    
    @Published var blankTarget: Subject = Subject.init(name: "", colour: Color.red)
    
    
    // functions
    /// Choose a subject to set the colour of
    ///
    /// Parameter index: Index of class in an array of which the colour is being changed.
    func startRecolouring(atIndex index: Int) {
        // set object, recolour, then set to some blank item
        isRecolouring = true
        colourTargetOnRecolour = index
    }
    
    /// Dismiss the ColourPopover UI
    func stopRecolouring() {
        isRecolouring = false
        colourTargetOnRecolour = 0
    }
    
    /// Set the colour of a UI object
    ///
    /// Parameter newColour: The colour which the UI object is set to.
    func setColour(_ newColour: Color) {
        if !isRecolouring {
            chosenColour = newColour
        } else {
            data.userSubjects[colourTargetOnRecolour].colour = newColour
        }
    }
}
