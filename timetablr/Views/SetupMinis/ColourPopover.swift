//
//  ColourPopoverView.swift
//  timetablr
//
//  Created on 22/05/2026.
//
//  Popover view for user to select class colour

import SwiftUI

/// Popover view for setting class colours
struct ColourPopover: View {
    @Environment(\.dismiss) private var dismiss
    
    @StateObject var colour: ColourController
    @StateObject var data: DataController
    
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
                colour.setColour(.blue)
            } label: {
                Text("blue")
                    .tint(.blue)
            }
            
            Button {
                colour.setColour(.green)
            } label: {
                Text("green")
                    .tint(.green)
            }
            
            Button {
                colour.setColour(.red)
            } label: {
                Text("red")
                    .tint(.red)
            }
            
            Spacer()
                .onDisappear() {
                    colour.stopRecolouring()
                }
        }
        .padding()
    }

}

#Preview {
    ColourPopover(colour: ColourController(data: DataController()), data: DataController())
}
