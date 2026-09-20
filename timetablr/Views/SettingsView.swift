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
                
                
                
                Spacer()
            }
            
        }
    }
}

#Preview {
    SettingsView(data: DataController.init(), state: StateController.init(), colour: ColourController.init(data: DataController.init()))
}
