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
    func startRecolouring(atIndex index: Int) {
        // set object, recolour, then set to some blank item
        isRecolouring = true
        colourTargetOnRecolour = index
    }
    
    func stopRecolouring() {
        isRecolouring = false
        colourTargetOnRecolour = 0
    }
    
    func setColour(of newColour: Color) {
        if !isRecolouring {
            chosenColour = newColour
        } else {
            data.userSubjects[colourTargetOnRecolour].colour = newColour
        }
    }
}
