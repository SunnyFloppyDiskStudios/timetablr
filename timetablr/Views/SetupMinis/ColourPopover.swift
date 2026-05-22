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
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ColourPopover()
}
