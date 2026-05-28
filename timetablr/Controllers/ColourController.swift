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

class ColourController: ObservableObject {
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
    func startRecolour(_ index: Int) {
        // set object, recolour, then set to some blank item
        isRecolouring = true
        colourTargetOnRecolour = index
    }
    
    func stopRecolour() {
        isRecolouring = false
        colourTargetOnRecolour = 0
    }
    
    func doColour(_ newColour: Color) {
        if !isRecolouring {
            chosenColour = newColour
        } else {
            data.userSubjects[colourTargetOnRecolour].colour = newColour
        }
    }
}
