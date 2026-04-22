//
//  InitialView.swift
//  timetablr
//
//  Created on 22/04/2026.
//
//  First load welcome (pre setup)

import SwiftUI

struct InitialView: View {
    @State private var transition = false
    
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
                SetupView()
            }
        }
    }
}

#Preview {
    InitialView()
}
