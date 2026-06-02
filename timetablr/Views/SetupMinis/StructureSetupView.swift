//
//  StructureSetupView.swift
//  timetablr
//
//  Created on 22/04/2026.
//
//  File for setting timetabl class structure

import SwiftUI

struct StructureSetupView: View {
    @State var periodCount = 0
    
    @StateObject var data: DataController
    @StateObject var colour: ColourController
    
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
                
                //MARK: - interactive space
                VStack {
                    Spacer()
                    // structure
                    List {
                        ForEach(data.userBaseDayStructure.indices, id: \.self) { i in
                            HStack {
                                Text(data.userBaseDayStructure[i].isPeriod ? "CLASS":"BREAK")
                                Spacer()
                                DatePicker(selection: $data.userBaseDayStructure[i].startTime, displayedComponents: [.hourAndMinute]) {}
                                Text("-")
                                DatePicker(selection: $data.userBaseDayStructure[i].endTime, displayedComponents: [.hourAndMinute]) {}
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
                            
                            data.userBaseDayStructure.append(Period.init(isPeriod: true, startTime: Date(), endTime: Date()))
                            
                        }, label: {
                            Text("Add class")
                        })
                        .padding()
                        .tint(.green)
                        
                        Spacer()
                        
                        Button(action: {
                            // add break
                            data.userBaseDayStructure.append(Period.init(isPeriod: false, startTime: Date(), endTime: Date()))
                            
                        }, label: {
                            Text("Add break")
                        })
                        .padding()
                        
                        Spacer()
                    }
                    .padding()
                }
                
                //MARK: - bottom bar
                NavigationLink {
                    ClassSetupView(colour: colour, data: data)
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
    StructureSetupView(data: DataController(), colour: ColourController(data: DataController()))
}
