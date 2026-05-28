//
//  ColourPopoverView.swift
//  timetablr
//
//  Created on 22/05/2026.
//
//  Popover view for user to select class colour

import SwiftUI

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
                colour.doColour(.blue)
            } label: {
                Text("blue")
                    .tint(.blue)
            }
            
            Button {
                colour.doColour(.green)
            } label: {
                Text("green")
                    .tint(.green)
            }
            
            Button {
                colour.doColour(.red)
            } label: {
                Text("red")
                    .tint(.red)
            }
            
            Spacer()
                .onDisappear() {
                    colour.stopRecolour()
                }
        }
        .padding()
    }

}

#Preview {
    ColourPopover(colour: ColourController(data: DataController()), data: DataController())
}
