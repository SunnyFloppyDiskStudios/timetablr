//
//  ClassSetupView.swift
//  timetablr
//
//  Created on 22/04/2026.
//
//  File for adding classes

import SwiftUI

struct ClassSetupView: View {    
    var body: some View {
        NavigationStack {
            VStack {
                // titles
                Text("What classes do you have?")
                    .font(.custom("Rubik", size: 30, relativeTo: .title))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Add all the classes you attend. You will be able to add these to your structure after.")
                    .padding()
                
                Spacer()
                
                // interactive space
                VStack {
                    Spacer()
                    
                    Text("Structure Setup")
                    
                    Spacer()
                    
                    NavigationLink {
                        // finish
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
    ClassSetupView()
}
