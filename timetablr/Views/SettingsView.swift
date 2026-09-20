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
    var body: some View {
        VStack(alignment: .leading) {
            Text("App Settings")
                .font(.custom("Rubik", size: 30, relativeTo: .title))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
            
            Button {
                
            } label: {
                HStack {
                    Text("Modify Structures")
                    Spacer()
                    
                    Text(">")
                }
                .padding()
            }
            
            Button {
                
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

#Preview {
    SettingsView()
}
