//
//  CheckboxToggleStyle.swift
//  timetablr
//
//  Created on 06/09/2026.
//
//  custom checkbox

import Foundation
import SwiftUI

/// Defines a checkbox style toggle similar to .checkbox on macOS.
struct CheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            VStack {
                configuration.label // checkbox text
                
                Image(systemName: configuration.isOn ? "checkmark.circle.fill" : "circle")
                    .foregroundStyle(.accent)
                    .font(.largeTitle)
            }
        }
        .buttonStyle(.plain)
    }
}
