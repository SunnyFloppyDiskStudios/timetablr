//
//  timetablrApp.swift
//  timetablr
//
//  Created on 22/04/2026.
//

import SwiftUI

@main
struct timetablrApp: App {
    // global
    @StateObject var data: DataController
    @StateObject var state: StateController
    
    // setup
    @StateObject var colour: ColourController

    init() {
        let dataController = DataController()

        _data = StateObject(wrappedValue: dataController)

        _colour = StateObject(wrappedValue: ColourController(data: dataController))
        
        _state = StateObject(wrappedValue: StateController())
    }
    
    var body: some Scene {
        WindowGroup {
            InitialView(data: data, colour: colour, state: state)
        }
    }
}
