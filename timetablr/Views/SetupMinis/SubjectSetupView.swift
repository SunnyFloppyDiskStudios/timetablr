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
                    
                    // !
                    
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
                                
                            } label: {
                                RoundedRectangle(cornerSize: CGSize.init(width: 30, height: 30))
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 30)
                                            .stroke(Color.black, lineWidth: 5)
                                    )
                            }
                            .padding(.horizontal)
                            
                            Button {
                                // add
                                
                            } label: {
                                Image(systemName: "plus")
                                    .fontWeight(.black)
                                    .frame(width: 40, height: 40)
                                    .font(.title)
                            }
                            .padding(.horizontal)
                        }
                        .padding(.horizontal)
                    }
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
}

#Preview {
    ClassSetupView()
}
