//
//  ColourPopoverView.swift
//  timetablr
//
//  Created on 22/05/2026.
//
//  Popover view for user to select class colour

import SwiftUI
import Combine

class ColourController: ObservableObject {
    @Published var chosenColour: Color = Color.red
}

struct ColourPopover: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var colour = ColourController()
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .fontWeight(.black)
                        .font(.title)
                }
                .buttonStyle(.glassProminent)
                
                Spacer()
            }
            Spacer()
            // colour selection space
            
            Text(">>>>>>>>>><<<<<<<<<<")
                .foregroundStyle(colour.chosenColour)
            
            Button {
                colour.chosenColour = .blue
            } label: {
                Text("blue")
                    .tint(.blue)
            }
            
            Button {
                colour.chosenColour = .green
            } label: {
                Text("green")
                    .tint(.green)
            }
            
            Button {
                colour.chosenColour = .red
            } label: {
                Text("red")
                    .tint(.red)
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ColourPopover()
}
