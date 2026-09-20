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
                Spacer()
                
                Text("Timetablr")
                    .font(.custom("Rubik", size: 60))
                    .fontWeight(.heavy)
                
                Spacer()
                
                Text("Your new favourite timetabling app.")
                    .padding(.horizontal)
                
                Text("Click below to get set up!")
                    .padding(.horizontal)
                    .padding(.bottom)
                    .bold()
                
                Button {
                    transition = true
                } label: {
                    Text("Begin Setup")
                        .font(.custom("Inter", size: 20))
                        .tint(.white)
                        .bold()
                }
                .padding()
                .clipShape(.capsule)
                .background(.blue)
                .cornerRadius(10)
                .fullScreenCover(isPresented: $transition) {
                    // fully hides initial view and prevents going backward
                    StructureSetupView(data: data, colour: colour, state: state) // stage 1
                }
            }
        }
    }
}

#Preview {
    InitialView(data: DataController(), colour: ColourController(data: DataController()), state: StateController())
}
