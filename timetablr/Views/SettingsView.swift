//
//  SettingsView.swift
//  timetablr
//
//  Created on 22/04/2026.
//
//  App settings

import SwiftUI

/// App settings view
struct SettingsView: View {
    @StateObject var data: DataController
    
    @StateObject var state: StateController
    
    @StateObject var colour: ColourController
    
    
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading) {
                Text("App Settings")
                    .font(.custom("Rubik", size: 30, relativeTo: .title))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Setup")
                    .font(.largeTitle)
                    .padding()
                
                // enter base structure setup
                NavigationLink {
                    StructureSetupView(data: data, colour: colour, state: state)
                } label: {
                    HStack {
                        Text("Modify Structures")
                        Spacer()
                        
                        Text(">")
                    }
                    .padding()
                }
                
                // enter class/subject setup
                NavigationLink {
                    SubjectSetupView(colour: colour, data: data, state: state)
                } label: {
                    HStack {
                        Text("Modify Subjects")
                        Spacer()
                        
                        Text(">")
                    }
                    .padding()
                }
                Text("Removing subjects will not remove them from the timetable.")
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                Text("Week Cycles")
                    .font(.largeTitle)
                    .padding()
                
                // set the number of cycles as well as current cycle
                Text("Equivalent to a week A,B,..,E cycle")
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal)
                
                HStack {
                    Text("Cycles:")
                    
                    Stepper(value: $data.numberOfCycles, in: 1...5, step: 1) {
                        Text("\($data.numberOfCycles.wrappedValue)")
                    }
                    .onChange(of: data.numberOfCycles) {
                        // fallback because sometimes current week can be more than allowed
                        if data.currentCycle > data.numberOfCycles {
                            data.currentCycle = data.numberOfCycles
                        }
                    }
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Current Week:  \($data.currentCycle.wrappedValue + 1)")
                    
                    Spacer()
                    
                    Picker("2", selection: $data.currentCycle) {
                        ForEach(0 ..< data.numberOfCycles, id: \.self) { t in
                            Text("\(t + 1)")
                        }
                    }
                    .onChange(of: data.currentCycle) {
                        print("CURRENT CYCLE CHANGED:", data.currentCycle)
                    }
                }
                .padding(.horizontal)

                
                Spacer()
            }
            
        }
    }
}

#Preview {
    SettingsView(data: DataController.init(), state: StateController.init(), colour: ColourController.init(data: DataController.init()))
}
