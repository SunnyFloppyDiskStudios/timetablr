//
//  StructureSetupView.swift
//  timetablr
//
//  Created on 22/04/2026.
//
//  File for setting timetabl class structure

import SwiftUI

/// Mini setup view for setting up the user's default day structure
struct StructureSetupView: View {
    @State var periodCount = 0
    
    @StateObject var data: DataController
    @StateObject var colour: ColourController
    @StateObject var state: StateController
    
    
    @State private var lastGivenHour: Int = 8 // last given end time hour
    @State private var lastGivenMinute: Int = 30 // last given end time minute
    
    var body: some View {
        NavigationStack {
            VStack {
                // titles
                Text("How do your days look?")
                    .font(.custom("Rubik", size: 30, relativeTo: .title))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Set up a layout for the structure of your days. You can set overrides later. Uses 24 hour time.")
                    .padding()
                
                Spacer()
                
                //MARK: - interactive space
                VStack {
                    Spacer()
                    // structure
                    List {
                        ForEach(data.userBaseDayStructure.indices, id: \.self) { i in
                            HStack {
                                Text(data.userBaseDayStructure[i].isPeriod ? "CLASS":"BREAK")
                                Spacer()
                                // hour
                                Picker("", selection: $data.userBaseDayStructure[i].startTime.hours) {
                                    ForEach(1 ..< 24, id: \.self) { t in
                                        Text(String(format: "%02d", t))
                                    }
                                }
                                .pickerStyle(.menu)
                                .menuIndicator(.hidden)
                                Text("  :")
                                // minute
                                Picker("", selection: $data.userBaseDayStructure[i].startTime.minutes) {
                                    ForEach(0 ..< 60, id: \.self) { t in
                                        Text(String(format: "%02d", t))
                                    }
                                }
                                .pickerStyle(.menu)
                                .menuIndicator(.hidden)

                                Text("    -  ")
                                
                                // hour
                                Picker("", selection: $data.userBaseDayStructure[i].endTime.hours) {
                                    ForEach(1 ..< 24, id: \.self) { t in
                                        Text(String(format: "%02d", t))
                                    }
                                }
                                .pickerStyle(.menu)
                                .menuIndicator(.hidden)
                                Text("  :")
                                // minute
                                Picker("", selection: $data.userBaseDayStructure[i].endTime.minutes) {
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
                        
                        Button(action: {
                            // add class
                            periodCount += 1
                            
                            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Time(hours: lastGivenHour, minutes: lastGivenMinute), endTime: Time(hours: lastGivenHour + 1, minutes: lastGivenMinute)))
                            
                        }, label: {
                            Text("Add class")
                        })
                        .padding(.horizontal)
                        .tint(.green)
                        
                        Spacer()
                        
                        Button(action: {
                            // add break
                            data.userBaseDayStructure.append(Period.init(isPeriod: false, startTime: Time(hours: lastGivenHour, minutes: lastGivenMinute), endTime: Time(hours: lastGivenHour + 1, minutes: lastGivenMinute)))
                            
                        }, label: {
                            Text("Add break")
                        })
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    .padding()
                    
                    // days
                    HStack {
                        ForEach(0 ..< 7, id: \.self) { d in
                            Toggle(daysChars[d], isOn: $data.displayDays[d])
                                .toggleStyle(CheckboxToggleStyle())
                        }
                    }
                }
                
                //MARK: - bottom bar
                NavigationLink {
                    ClassSetupView(colour: colour, data: data, state: state)
                } label: {
                    Text("Next")
                    Image(systemName: "chevron.right")
                }
                .padding()
            }
        }
    }
    
    //MARK: - functions
    
    func deleteItem(atIndex pos: IndexSet) {
        data.userBaseDayStructure.remove(atOffsets: pos)
    }
}

#Preview {
    StructureSetupView(data: DataController(), colour: ColourController(data: DataController()), state: StateController())
}
