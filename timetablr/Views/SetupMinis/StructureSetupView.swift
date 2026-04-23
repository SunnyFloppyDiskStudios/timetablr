//
//  StructureSetupView.swift
//  timetablr
//
//  Created on 22/04/2026.
//
//  File for setting timetabl class structure

import SwiftUI

struct StructureSetupView: View {
    var body: some View {
        NavigationStack {
            VStack {
                // titles
                Text("How do your days look?")
                    .font(.custom("Rubik", size: 30, relativeTo: .title))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Set up a layout for the structure of your days. You can set overrides later.")
                    .padding()
                
                Spacer()
                
                // interactive space
                VStack {
                    Spacer()
                    
                    Text("Structure Setup")
                    
                    Spacer()
                    
                    NavigationLink {
                        
                        ClassSetupView()
                    } label: {
                        Text("Next")
                        Image(systemName: "chevron.right")
                    }
                }
            }
        }
    }
}

#Preview {
    StructureSetupView()
}
