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
            VStack(spacing: 0) {
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
                        // expand to view more info
                        
                    } label: {
                        HStack {
                            Text(className)
                                .padding()
                                .fontWeight(.bold)
                                .font(.system(size: 30))
                            
                            Spacer()
                            
                            Text("\(data.userBaseDayStructure[i].startTime.hours):\(String(format: "%02d", data.userBaseDayStructure[i].startTime.minutes)) - \(data.userBaseDayStructure[i].endTime.hours):\(String(format: "%02d", data.userBaseDayStructure[i].endTime.minutes))")
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
    TimetableView(data: DataController(), dayInt: 0)
}
