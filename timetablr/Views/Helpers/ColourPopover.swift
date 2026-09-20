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
            // MARK: - colour selection space
            
            Text("Choose a colour:")
                .font(.custom("Rubik", size: 30, relativeTo: .title))
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .padding()
                
            
            ColorPicker("Choose colour", selection: $colour.chosenColour)
                .labelsHidden()
                .scaleEffect(2)
                .padding()
            
            HStack {
                Text("Example")
                    .padding()
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                
                Spacer()
                
                Text("8:45 - 9:45")
                    .padding()
            }
            .frame(height: 70)
            .background($colour.chosenColour.wrappedValue)
            .cornerRadius(15)
            .foregroundStyle(.inverseTextColour)
            .padding(.vertical, 9)
            .padding(.horizontal, 10)
            
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
