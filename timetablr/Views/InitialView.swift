//
//  InitialView.swift
//  timetablr
//
//  Created on 22/04/2026.
//
//  First load welcome (pre setup)

import SwiftUI

/// Welcome screen on first load
struct InitialView: View {
    @State private var transition = false
    
    @StateObject var data: DataController
    @StateObject var colour: ColourController
    @StateObject var state: StateController
    
    var body: some View {
        if $state.setupComplete.wrappedValue {
            ContentView(data: data, state: state)
        } else {
            VStack {
                Text("Timetablr")
                    .font(.custom("Rubik", size: 30))
                    .fontWeight(.bold)
                
                Button(action: {
                    transition = true
                }) {
                    Text("Begin Setup")
                        .font(.custom("Inter", size: 20))
                }
                .padding()
                .fullScreenCover(isPresented: $transition) {
                    StructureSetupView(data: data, colour: colour, state: state) // stage 1
                }
            }
        }
    }
}

#Preview {
    InitialView(data: DataController(), colour: ColourController(data: DataController()), state: StateController())
}
