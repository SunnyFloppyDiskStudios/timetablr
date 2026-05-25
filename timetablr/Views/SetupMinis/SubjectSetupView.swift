//
//  ClassSetupView.swift
//  timetablr
//
//  Created on 22/04/2026.
//
//  File for adding classes

import SwiftUI

struct ClassSetupView: View {
    @State private var className: String = ""
    @FocusState private var classFieldIsFocused: Bool
    
    @State private var doPresentColours: Bool = false
    
    @StateObject var colour = ColourController()
    @StateObject var data = DataController()

    var body: some View {
        NavigationStack {
            VStack {
                // titles
                Text("What classes do you have?")
                    .font(.custom("Rubik", size: 30, relativeTo: .title))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("Add all the classes you attend. You will be able to add these to your structure after.")
                    .padding()
                
                Spacer()
                
                // interactive space
                VStack {
                    Spacer()
                    
                    List {
                        ForEach(data.userSubjects.indices, id: \.self) { i in
                            Text(data.userSubjects[i].name)
                                .foregroundStyle(data.userSubjects[i].colour)
                        }
                        .onDelete(perform: deleteItem);
                    }
                    
                    Spacer()
                    
                    HStack {
                        HStack {
                            TextField("Class Name", text: $className)
                                .focused($classFieldIsFocused)
                                .onSubmit {
                                    
                                }
                                .textInputAutocapitalization(.never)
                                .disableAutocorrection(true)
                                .padding()
                                .font(.title)
                        }
                        
                        HStack {
                            Button {
                                // colour
                                doPresentColours = true
                                
                            } label: {
                                RoundedRectangle(cornerSize: CGSize.init(width: 30, height: 30))
                                    .frame(width: 30, height: 30)
                                    .foregroundStyle(colour.chosenColour)
                            }
                            .popover(isPresented: $doPresentColours) {
                                ColourPopover(colour: colour)
                            }
                            
                            Button {
                                // add
                                data.userSubjects.append(Subject(name: className, colour: colour.chosenColour))
                                
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
    
    func deleteItem(_ pos: IndexSet) {
        data.userSubjects.remove(atOffsets: pos)
    }
}

#Preview {
    ClassSetupView()
}
