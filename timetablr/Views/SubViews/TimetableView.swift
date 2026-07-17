//
//  TimetableView.swift
//  timetablr
//
//  Created on 16/07/2026.
//

import SwiftUI

struct TimetableView: View {
    @StateObject var data: DataController
    
    var dayInt: Int
    
    var body: some View {
        ScrollView {
            VStack {
//                ForEach(0 ..< data.userBaseDayStructure.count, id: \.self) { i in
//                    Text("\(data.userBaseDayStructure[i])")
//                }
            }
        }
        .onAppear() {
            // DEBUG
            data.userDaySubjects.append(DaySubjects.init(day: 1, subjects: [
                Class.init(subject: Subject.init(name: "Test1", colour: .red)),
                Class.init(subject: Subject.init(name: "Test2", colour: .red)),
                Class.init(subject: Subject.init(name: "Test3", colour: .red)),
                Class.init(subject: Subject.init(name: "Test4", colour: .red)),
                Class.init(subject: Subject.init(name: "Test5", colour: .red)),
            ]))
            
//            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: getDateFromString("08:45"), endTime: getDateFromString("09:45")))
//            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: getDateFromString("09:45"), endTime: getDateFromString("10:45")))
//            data.userBaseDayStructure.append(Period.init(isPeriod: false, startTime: getDateFromString("10:45"), endTime: getDateFromString("11:15")))
//            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: getDateFromString("11:15"), endTime: getDateFromString("12:15")))
//            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: getDateFromString("12:15"), endTime: getDateFromString("13:15")))
//            data.userBaseDayStructure.append(Period.init(isPeriod: false, startTime: getDateFromString("13:15"), endTime: getDateFromString("14:00")))
//            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: getDateFromString("14:30"), endTime: getDateFromString("15:30")))
        }
    }
}

#Preview {
    TimetableView(data: DataController(), dayInt: 0)
}
