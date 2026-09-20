//
//  OverrideStructureSetupView.swift
//  timetablr
//
//  Created on 20/09/2026.
//
//  File for setting specific timetable overrides. Derived from StructureSetupView

import SwiftUI

/// Mini setup view for setting up the user's default day structure
struct OverrideStructureSetupView: View {
    @State var periodCount = 0
    
    @StateObject var data: DataController
    @StateObject var state: StateController
    
    var dayInt: Int
    var cycle: Int
    
    @State private var lastGivenHour: Int = 8 // last given end time hour
    @State private var lastGivenMinute: Int = 30 // last given end time minute
    
    @State private var overrideStructure = [Period]()
    
    // initialise variables because they aren't assumed to be non-existant
    init(data: DataController, state: StateController, dayInt: Int, cycle: Int) {
        self._data = StateObject(wrappedValue: data)
        self._state = StateObject(wrappedValue: state)
        self.dayInt = dayInt
        self.cycle = cycle

        if let existing = data.userOverrideDayStructures.first(where: { $0.cycle == cycle && $0.day == dayInt }) {
            self._overrideStructure = State(initialValue: existing.classes)
        } else {
            self._overrideStructure = State(initialValue: data.userBaseDayStructure)
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // titles
                Text("How does this day look?")
                    .font(.custom("Rubik", size: 30, relativeTo: .title))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Set up a structure override for this specific day.")
                    .padding()
                
                Spacer()
                
                // MARK: - interactive space
                
                VStack {
                    Spacer()
                    // structure
                    List {
                        ForEach(overrideStructure.indices, id: \.self) { i in
                            HStack {
                                Text(overrideStructure[i].isPeriod ? "CLASS":"BREAK")
                                Spacer()
                                // hour
                                Picker("", selection: $overrideStructure[i].startTime.hours) {
                                    ForEach(1 ..< 24, id: \.self) { t in
                                        Text(String(format: "%02d", t))
                                    }
                                }
                                .pickerStyle(.menu)
                                .menuIndicator(.hidden)
                                Text("  :")
                                // minute
                                Picker("", selection: $overrideStructure[i].startTime.minutes) {
                                    ForEach(0 ..< 60, id: \.self) { t in
                                        Text(String(format: "%02d", t))
                                    }
                                }
                                .pickerStyle(.menu)
                                .menuIndicator(.hidden)

                                Text("    -  ")
                                
                                // hour
                                Picker("", selection: $overrideStructure[i].endTime.hours) {
                                    ForEach(1 ..< 24, id: \.self) { t in
                                        Text(String(format: "%02d", t))
                                    }
                                }
                                .pickerStyle(.menu)
                                .menuIndicator(.hidden)
                                Text("  :")
                                // minute
                                Picker("", selection: $overrideStructure[i].endTime.minutes) {
                                    ForEach(0 ..< 60, id: \.self) { t in
                                        Text(String(format: "%02d", t))
                                    }
                                }
                                .pickerStyle(.menu)
                                .menuIndicator(.hidden)

                            }
                        }
                        .onDelete(perform: deleteItem);
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            // add class
                            periodCount += 1
                            
                            overrideStructure.append(Period.init(isPeriod: true, startTime: Time(hours: lastGivenHour, minutes: lastGivenMinute), endTime: Time(hours: lastGivenHour + 1, minutes: lastGivenMinute)))
                            
                        } label: {
                            Text("Add class")
                        }
                        .padding(.horizontal)
                        .tint(.green)
                        
                        Spacer()
                        
                        Button {
                            // add break
                            overrideStructure.append(Period.init(isPeriod: false, startTime: Time(hours: lastGivenHour, minutes: lastGivenMinute), endTime: Time(hours: lastGivenHour + 1, minutes: lastGivenMinute)))
                            
                        } label: {
                            Text("Add break")
                        }
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding()
                }
            }
        }
        .onDisappear {
            // save changes
            
            if let index = data.userOverrideDayStructures.firstIndex(where: { $0.cycle == cycle && $0.day == dayInt }) {
                data.userOverrideDayStructures[index].classes = overrideStructure
            } else {
                data.userOverrideDayStructures.append(OverridenDayStructure(cycle: cycle, day: dayInt, classes: overrideStructure))
            }
        }
    }
    
    // MARK: - functions
    
    /// Deletes an item in an array.
    /// - Parameter pos: The position to remove the item from. (IndexSet)
    func deleteItem(atIndex pos: IndexSet) {
        overrideStructure.remove(atOffsets: pos)
    }
}

#Preview {
    OverrideStructureSetupView(data: DataController(), state: StateController(), dayInt: 0, cycle: 0)
}
