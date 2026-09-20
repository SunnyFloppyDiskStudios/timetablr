//
//  TimetableView.swift
//  timetablr
//
//  Created on 16/07/2026.
//
//  Helper embedded view for displaying a day's timetable

import SwiftUI

/// Embedded timetable view
struct TimetableView: View {
    @ObservedObject var data: DataController
    
    var dayInt: Int
    
    @Binding var selectedClass: Subject?
    var editMode: Bool
    
    // needs initialisation to properly access parent level data (ContentView)
    init(data: DataController, dayInt: Int, selectedClass: Binding<Subject?>, editMode: Bool) {
        self.data = data
        self.dayInt = dayInt
        self.editMode = editMode
        self._selectedClass = selectedClass
    }
    
    var body: some View {
        let structure = data.userOverrideDayStructures.first(where: { $0.cycle == data.currentCycle && $0.day == dayInt })?.classes ?? data.userBaseDayStructure

        ScrollView {
            VStack(spacing: 0) {
                ForEach(structure.indices, id: \.self) { i in
                    let isPeriod = structure[i].isPeriod
                    
                    let periodID = structure[i].id
                    let relevantSubject = data.userDaySubjects.first(where: { $0.cycle == data.currentCycle && $0.day == dayInt })?.subjects.first(where: { $0.periodID == periodID })?.subject
                    
                    let className: String = {
                        if !isPeriod { return "Break" }

                        return relevantSubject?.name ?? ""
                    }()
                    
                    Button {
                        if editMode && isPeriod, let selectedClass {
                            if let dayIndex = data.userDaySubjects.firstIndex(where: { $0.cycle == data.currentCycle && $0.day == dayInt }) {
                                if let classIndex = data.userDaySubjects[dayIndex].subjects.firstIndex(where: { $0.periodID == periodID }) {
                                    // assuming day data exists, set the class
                                    data.userDaySubjects[dayIndex].subjects[classIndex].subject = selectedClass
                                } else {
                                    // if for some reason the slot doesn't exist
                                    data.userDaySubjects[dayIndex].subjects.append(Class(periodID: periodID, subject: selectedClass))
                                }
                            } else {
                                // create day data if non existant
                                data.userDaySubjects.append(DaySubjects(cycle: data.currentCycle, day: dayInt, subjects: [Class(periodID: periodID, subject: selectedClass)]))
                            }
                        }
                    } label: {
                        HStack {
                            Text(className)
                                .padding()
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                            
                            Spacer()
                            
                            Text("\(structure[i].startTime.hours):\(String(format: "%02d", structure[i].startTime.minutes)) - \(structure[i].endTime.hours):\(String(format: "%02d", structure[i].endTime.minutes))")
                                .padding()
                        }
                        .frame(height: 70)
                        .background(relevantSubject?.colour ?? .secondaryBackground)
                        .cornerRadius(15)
                        .foregroundStyle(.inverseTextColour)
                        .padding(.vertical, 9)
                        .padding(.horizontal, 10)
                        
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var selectedClass: Subject? = Optional(Subject(name: "blankeditpreview", colour: Color.black))
    
    TimetableView(data: DataController(), dayInt: 0, selectedClass: $selectedClass, editMode: false)
}
