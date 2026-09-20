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
    
    @StateObject var state: StateController
    
    @State private var scrollID: Int? = 0
    
    // edit mode variables
    @State private var selectedClass: Subject?
    @State private var selectedSpace = String()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    ZStack(alignment: .topTrailing) {
                        // nav bar (day bar)
                        VStack {
                            // MARK: -  top bar
                            
                            // navigation area
                            HStack {
                                Text("Timetablr")
                                    .font(.custom("Rubik", size: 35, relativeTo: .title))
                                    .fontWeight(.semibold)
                                
                                Spacer()
                                
                                // toolbar
                                HStack {
                                    Menu {
                                        ForEach(1...data.numberOfCycles, id: \.self) { cycle in
                                            Button {
                                                data.currentCycle = cycle
                                            } label: {
                                                Text("Week \(String(UnicodeScalar(64 + cycle)!))")
                                            }
                                        }
                                    } label: {
                                        Text(String(UnicodeScalar(64 + data.currentCycle)!))
                                            .font(.custom("Rubik", size: 35, relativeTo: .title))
                                            .fontWeight(.semibold)
                                    }
                                    .padding(.trailing)
                                    
                                    Button {
                                        // open edit settings
                                        $state.tTableEditMode.wrappedValue = !$state.tTableEditMode.wrappedValue
                                        
                                    } label: {
                                        Image(systemName: "slider.horizontal.3")
                                            .font(.system(size: 30))
                                    }
                                    .padding(.trailing)
                                    
                                    NavigationLink {
                                        // open settings
                                        SettingsView(data: data, state: state, colour: ColourController.init(data: data))
                                    } label: {
                                        Image(systemName: "gear")
                                            .font(.system(size: 30))
                                    }
                                }
                                .padding(.horizontal)
                            }
                            
                            // MARK: - timetable view
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 0) {
                                    ForEach(0 ..< data.displayDays.count, id: \.self) { i in
                                        if data.displayDays[i] == true {
                                            TimetableView(data: data, dayInt: i, selectedClass: $selectedClass, editMode: state.tTableEditMode)
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
                                }
                                .scrollTargetLayout()
                            }
                            .scrollTargetBehavior(.paging)
                            .scrollPosition(id: $scrollID)
                            
                            // MARK: - bottom bar
                            
                            // monday to friday view
                            ScrollView(.horizontal, showsIndicators: false) {
                                LazyHStack(spacing: 10) {
                                    ForEach(0 ..< data.displayDays.count, id: \.self) { i in
                                        if data.displayDays[i] == true {
                                            let day = days[i]
                                            
                                            Text(day)
                                                .font(.largeTitle)
                                                .fontWeight(.heavy)
                                                .foregroundStyle(i == scrollID ? .primary : .tertiary)
                                        }
                                    }
                                }
                                .scrollTargetLayout()
                            }
                            .scrollTargetBehavior(.viewAligned)
                            .fixedSize(horizontal: false, vertical: true)
                            
                            // MARK: - edit mode
                            // stack containing the user's draggable set classes
                            if $state.tTableEditMode.wrappedValue {
                                ScrollView {
                                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 10) {
                                        ForEach($data.userSubjects) { s in
                                            Button {
                                                selectedClass = s.wrappedValue
                                            } label: {
                                                Text(s.name.wrappedValue)
                                                    .padding()
                                                    .tint(.white)
                                                    .background(s.colour.wrappedValue)
                                                    .cornerRadius(10)
                                                    .fontWeight(selectedClass?.name == s.name.wrappedValue ? .heavy : .regular)
                                            }
                                        }
                                    }
                                }
                                .frame(height: 200)
                            }
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
    @Previewable @StateObject var data = DataController()
        
    ContentView(data: data, state: StateController())
        .onAppear() {            
            data.userSubjects.append(Subject.init(name: "Maths", colour: Color.red))
            data.userSubjects.append(Subject.init(name: "English", colour: Color.blue))
            data.userSubjects.append(Subject.init(name: "Phsyics", colour: Color.green))
            data.userSubjects.append(Subject.init(name: "DigiTech", colour: Color.yellow))
            data.userSubjects.append(Subject.init(name: "Art", colour: Color.purple))

            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Time(hours: 8, minutes: 45), endTime: Time(hours: 9, minutes: 45)))
            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Time(hours: 9, minutes: 45), endTime: Time(hours: 10, minutes: 45)))
            data.userBaseDayStructure.append(Period.init(isPeriod: false, startTime: Time(hours: 10, minutes: 45), endTime: Time(hours: 11, minutes: 15)))
            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Time(hours: 11, minutes: 15), endTime: Time(hours: 12, minutes: 15)))
            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Time(hours: 12, minutes: 15), endTime: Time(hours: 13, minutes: 15)))
            data.userBaseDayStructure.append(Period.init(isPeriod: false, startTime: Time(hours: 13, minutes: 15), endTime: Time(hours: 14, minutes: 00)))
            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Time(hours: 14, minutes: 30), endTime: Time(hours: 15, minutes: 30)))

            data.userDaySubjects.append(DaySubjects(cycle: 1, day: 0, subjects: [
                Class(periodID: data.userBaseDayStructure[0].id, subject: Subject(name: "Maths", colour: .red)),
                Class(periodID: data.userBaseDayStructure[1].id, subject: Subject(name: "English", colour: .blue)),
                Class(periodID: data.userBaseDayStructure[3].id, subject: Subject(name: "Physics", colour: .green)),
                Class(periodID: data.userBaseDayStructure[4].id, subject: Subject(name: "DigiTech", colour: .yellow)),
                Class(periodID: data.userBaseDayStructure[6].id, subject: Subject(name: "Art", colour: .purple))
            ]))
        }
}
