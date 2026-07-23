//
//  TimetableView.swift
//  timetablr
//
//  Created on 16/07/2026.
//

import SwiftUI

struct TimetableView: View {
    init(data: DataController, dayInt: Int) {
        self.data = data
        self.dayInt = dayInt
        print("TIMETABLE CREATED:", dayInt)
    }
    
    @ObservedObject var data: DataController
    
    var dayInt: Int
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0 ..< data.userBaseDayStructure.count, id: \.self) { i in
                    let isPeriod = data.userBaseDayStructure[i].isPeriod
                    
                    let relevantSubject = data.userDaySubjects
                        .first(where: { $0.day == dayInt })?
                        .subjects
                        .first(where: { $0.period == i })?
                        .subject

                    let className: String = {
                        if !isPeriod { return "Break" }

                        return relevantSubject?.name ?? ""
                    }()
                    
                    Button {
                        
                    } label: {
                        HStack {
                            Text(className)
                                .padding()
                            
                            Spacer()
                            
                            Text("\(data.userBaseDayStructure[i].startTime.hours):\(data.userBaseDayStructure[i].startTime.minutes) - \(data.userBaseDayStructure[i].endTime.hours):\(data.userBaseDayStructure[i].endTime.minutes)")
                                .padding()
                        }
                        .background(relevantSubject?.colour)
                        .foregroundStyle(.black)
                    }
                }
            }
        }
    }
}

#Preview {
    TimetableView(data: DataController(), dayInt: 0)
}
