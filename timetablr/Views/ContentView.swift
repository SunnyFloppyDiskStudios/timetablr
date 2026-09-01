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
        NavigationStack {
            VStack {
                VStack {
                    ZStack(alignment: .topTrailing) {
                        // nav bar (day bar)
                        VStack {
                            // timetable view
                            HStack {
                                Text("Timetablr")
                                    .font(.largeTitle)
                                
                                Spacer()
                                
                                // toolbar
                                HStack {
                                    Button {
                                        // open edit settings
                                        
                                        
                                        
                                        
                                        
                                        
                                    } label: {
                                        Image(systemName: "slider.horizontal.3")
                                            .font(.system(size: 30))
                                    }
                                    .padding(.trailing)
                                    
                                    NavigationLink {
                                        // open settings
                                        
                                        
                                        
                                        
                                        
                                        
                                        SettingsView()
                                    } label: {
                                        Image(systemName: "gear")
                                            .font(.system(size: 30))
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0) {
                                    ForEach(0 ..< data.displayDays.count, id: \.self) { i in
                                        TimetableView(data: data, dayInt: i)
                                            .containerRelativeFrame(.horizontal)
                                            .scrollTransition(.animated, axis: .horizontal) { content, phase in
                                                content
                                                    .opacity(phase.isIdentity ? 1.0 : 0.6)
                                            }
                                            .onAppear {
                                                print("APPEARED:", i)
                                            }
                                            .onDisappear {
                                                print("DISAPPEARED:", i)
                                            }
                                    }
                                }
                                .scrollTargetLayout()
                            }
                            .scrollTargetBehavior(.paging)
                            .scrollPosition(id: $scrollID)
                            
                            // monday to friday view
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
                        }
                        
                        .padding(.vertical)
                        
                        Spacer()
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView(data: DataController())
}
