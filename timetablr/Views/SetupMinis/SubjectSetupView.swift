//
//  ClassSetupView.swift
//  timetablr
//
//  Created on 22/04/2026.
//
//  File for adding classes

import SwiftUI

/// Mini setup view for adding the subject classes a user will have
struct ClassSetupView: View {
    @State private var className: String = ""
    @FocusState private var classFieldIsFocused: Bool
    
    @State private var shouldPresentColours: Bool = false
    
    @StateObject var colour: ColourController
    @StateObject var data: DataController

    var body: some View {
        NavigationStack {
            VStack {
                // titles
                Text("What classes do you have?")
                    .font(.custom("Rubik", size: 30, relativeTo: .title))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Add all the subjects you attend. You will be able to add these to your structure after.")
                    .padding()
                
                Spacer()
                
                // interactive space
                VStack {
                    Spacer()
                    
                    List {
                        ForEach(data.userSubjects.indices, id: \.self) { i in
                            Button() {
                                shouldPresentColours = true
                                colour.startRecolouring(atIndex: i)
                            } label: {
                                Text(data.userSubjects[i].name)
                                    .foregroundStyle(data.userSubjects[i].colour)
                            }
                        }
                        .onDelete(perform: deleteItem);
                    }
                    
                    Spacer()
                    
                    HStack {
                        HStack {
                            TextField("Class Name", text: $className)
                                .focused($classFieldIsFocused)
                                .onSubmit {
                                    // add
                                    data.userSubjects.append(Subject(name: className, colour: colour.chosenColour))
                                    
                                    className = ""
                                }
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .padding()
                                .font(.title)
                        }
                        
                        HStack {
                            Button {
                                // colour
                                shouldPresentColours = true
                                
                            } label: {
                                RoundedRectangle(cornerSize: CGSize.init(width: 30, height: 30))
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(colour.chosenColour)
                            }
                            .popover(isPresented: $shouldPresentColours) {
                                ColourPopover(colour: colour, data: data)
                            }
                            
                            Button {
                                // add
                                if (!className.isEmpty) {
                                    data.userSubjects.append(Subject(name: className, colour: colour.chosenColour))
                                }

                                className = ""
                                
                            } label: {
                                Image(systemName: "plus")
                                    .fontWeight(.black)
                                    .frame(width: 40, height: 40)
                                    .font(.title)
                                    .buttonStyle(.glassProminent)
                            }
                            .padding(.leading)
                        }
                        .padding(.horizontal)
                    }
                    .glassEffect()
                    .padding(.horizontal)
                }
                
                
                // next button
                NavigationLink {
                    // finish
                } label: {
                    Text("Next")
                    Image(systemName: "chevron.right")
                }
                .padding()
            }
        }
    }
    
    func deleteItem(atIndex pos: IndexSet) {
        data.userSubjects.remove(atOffsets: pos)
    }
}

#Preview {
    ClassSetupView(colour: ColourController(data: DataController()), data: DataController())
}
