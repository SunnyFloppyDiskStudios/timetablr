//
//  StructureSetupView.swift
//  timetablr
//
//  Created on 22/04/2026.
//
//  File for setting timetabl class structure

import SwiftUI

struct StructureSetupView: View {
    @State var period = 1
    @State var sdate = Date()
    @State var edate = Date()
    
    var body: some View {
        NavigationStack {
            VStack {
                // titles
                Text("How do your days look?")
                    .font(.custom("Rubik", size: 30, relativeTo: .title))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Set up a layout for the structure of your days. You can set overrides later.")
                    .padding()
                
                Spacer()
                
                // interactive space
                VStack {
                    Spacer()
                    // structure
                    List {
                        ForEach(0 ..< userBaseStructure.count, id: \.self) { i in
                            HStack {
                                Text(
                                    Int(userBaseStructure[i].first.unsafelyUnwrapped) ?? 0 > 0 ?
                                        "CLASS \(userBaseStructure[i].first.unsafelyUnwrapped)"
                                    :
                                        "BREAK"
                                
                                )
                                Spacer()
                                DatePicker(selection: $edate, displayedComponents: [.hourAndMinute]) {}
                                Text("-")
                                DatePicker(selection: $sdate, displayedComponents: [.hourAndMinute]) {}
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        Button(action: {
                            // add class
                        }, label: {
                            Text("Add class")
                        })
                        .padding()
                        .tint(.green)
                        
                        Spacer()
                        
                        Button(action: {
                            // add class
                        }, label: {
                            Text("Add break")
                        })
                        .padding()
                        
                        Spacer()
                    }
                    .padding()
                }
                
                // next button
                NavigationLink {
                    ClassSetupView()
                } label: {
                    Text("Next")
                    Image(systemName: "chevron.right")
                }
                .padding()
            }
        }
    }
}

#Preview {
    StructureSetupView()
}


//HStack {
//    Text("CLASS \($period.wrappedValue)")
//    Spacer()
//    DatePicker(selection: $edate, displayedComponents: [.hourAndMinute]) {}
//    Text("-")
//    DatePicker(selection: $sdate, displayedComponents: [.hourAndMinute]) {}
//}
