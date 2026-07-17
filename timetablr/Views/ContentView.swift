//
//  ContentView.swift
//  timetablr
//
//  Created on 22/04/2026.
//
//  Main Timetable view

import SwiftUI

/// Main timetable view
struct ContentView: View {
    @StateObject var data: DataController
    
    @State private var scrollID: Int? = 0
    
    var body: some View {
        VStack {
            // navbar
            // week cycle toggler
            
            // timetable view
            // scrolling weekdays
            // scrolling timetable views (carousel)
            VStack {
                // nav bar (day bar)
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 10) {
                        ForEach(0 ..< data.displayDays.count, id: \.self) { i in
                            let day = data.days[i]
                            
                            Text(day)
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                                .foregroundStyle(i == scrollID ? .primary : .tertiary)
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.viewAligned)
                .fixedSize(horizontal: false, vertical: true)
                
                // timetable view
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: 0) {
                        ForEach(0 ..< data.displayDays.count, id: \.self) { i in
                            TimetableView(data: data, dayInt: i)
                                .containerRelativeFrame(.horizontal)
                                .scrollTransition(.animated, axis: .horizontal) { content, phase in
                                    content
                                        .opacity(phase.isIdentity ? 1.0 : 0.6)
                                }
                        }
                    }
                    .scrollTargetLayout()
                }
                .scrollTargetBehavior(.paging)
                .scrollPosition(id: $scrollID)
            }
            .padding(.vertical)
            
            Spacer()
            
            // bottom bar
            // menu - edit
        }
        .padding()
    }
}

#Preview {
    ContentView(data: DataController())
}
