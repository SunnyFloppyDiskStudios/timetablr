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
    
    var body: some View {
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
                StructureSetupView(data: data, colour: colour) // stage 1
            }
        }
    }
}

#Preview {
    InitialView(data: DataController(), colour: ColourController(data: DataController()))
}
