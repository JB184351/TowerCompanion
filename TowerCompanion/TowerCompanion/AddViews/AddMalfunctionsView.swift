//
//  AddMalfunctionsView.swift
//  TowerCompanion
//
//  Created by Justin on 7/3/23.
//

import SwiftUI

struct AddMalfunctionsView: View {
    @State private var isPermanent = false
    @State private var malfunctionDescription = ""
    @State private var malfunctionRemovalCondition = ""
    @State private var isFirstView = false
    @State private var listOfPermanentMalfunctions: [String] = []
    @State private var shouldShowMaxNumberOfRegularMalfunctionsAlert = false
    @State private var shouldShowMaxNumberOfPermanentMalfunctionsAlert = false
    @State private var shouldShowMaxNumberOfMalfunctionsAlert = false
    @State private var hasShownMaxPermanentAlert = false
    @State private var hasShownMaxRegularAlert = false
    @Binding var malfunctions: [Malfunction]
    
    var permanentMalfunctions: [String] {
        Malfunction.getAllPermanentMalfunctions()
    }
    
    var body: some View {
        Section {
            Toggle("Is this a permanent Malfunction?", isOn: $isPermanent)
                .disabled(isTooManyPermanentMalfunctions())
            if isPermanent {
                Picker("Malfunctions", selection: $malfunctionDescription) {
                    ForEach(listOfPermanentMalfunctions, id:\.self) { malfunction in
                        Text(malfunction).tag(malfunction)
                    }
                }
                
            }
            
            if !isPermanent {
                TextField("Enter the Malfunction Description", text: $malfunctionDescription)
                    .disabled(isTooManyRegularMalfunctions())
                TextField("Enter Malfunction Removal Condition", text: $malfunctionRemovalCondition)
                    .disabled(isTooManyRegularMalfunctions())
            }
            
            Button("Add Malfunction") {
                withAnimation() {
                    addMalfunction()
                }
            }
            .disabled(disableAddMalfunctionButton())
            .alert("Max number of (2) regular malfunctions have been entered and TextFields will now be disabled", isPresented: $shouldShowMaxNumberOfRegularMalfunctionsAlert) { Button("OK", role: .cancel) { hasShownMaxRegularAlert = true } }
            .alert("Max number of (5) permanent malfunctions have been entered", isPresented: $shouldShowMaxNumberOfPermanentMalfunctionsAlert) { Button("OK", role: .cancel) { hasShownMaxPermanentAlert = true } }
            .alert("Max number of malfunctions (7) have been entered", isPresented: $shouldShowMaxNumberOfMalfunctionsAlert) { }
            
            Button("Clear All Malfunctions") {
                withAnimation {
                    reset()
                }
            }
            .disabled(malfunctions.count < 1)
        }
        // Some reason the malfunctions array gets 1 item
        // inserted so I'm removing it forcibly until I
        // can figure out why that is
        .onAppear {
            if !isFirstView {
                malfunctions.removeAll()
                isFirstView = true
            }
            
            listOfPermanentMalfunctions = permanentMalfunctions
            
        }
        .onChange(of: isPermanent) { oldValue, newValue in
            malfunctionDescription = isPermanent ? listOfPermanentMalfunctions[0] : ""
            
            if isPermanent {
                malfunctionRemovalCondition = ""
            }
        }
        
        if malfunctions.count > 0 {
            Section {
                ForEach(malfunctions, id: \.self) { malfunction in
                    Text(malfunction.malfunctionType == .normal ? "Malfunction: \(malfunction.malfunctionDescription) \nCondition To Remove: \(malfunction.conditionToRemove)" : malfunction.malfunctionDescription)
                        .multilineTextAlignment(.leading)
                }
            }
        }
    }
    
    private func addMalfunction() {
        let malfunctionType: MalfunctionType = isPermanent ? .permanent : .normal
        
        let malfunction = Malfunction(malfunctionDescription: malfunctionDescription, conditionToRemove: malfunctionRemovalCondition, malfunctionType: malfunctionType)
        malfunctions.append(malfunction)
        
        if isTooManyPermanentMalfunctions() && !hasShownMaxPermanentAlert {
            isPermanent = false
            shouldShowMaxNumberOfPermanentMalfunctionsAlert = true
        }
        
        if isTooManyRegularMalfunctions() && !hasShownMaxRegularAlert {
            shouldShowMaxNumberOfRegularMalfunctionsAlert = true
        }
        
        if malfunctions.count == 7 {
            shouldShowMaxNumberOfMalfunctionsAlert = true
        }
        
        listOfPermanentMalfunctions.removeAll(where: { $0 == malfunctionDescription })
        
        malfunctionDescription = isPermanent ? listOfPermanentMalfunctions[0] : ""
        malfunctionRemovalCondition = ""
    }
    
    private func reset() {
        malfunctions.removeAll()
        listOfPermanentMalfunctions = permanentMalfunctions
        malfunctionDescription = isPermanent ? listOfPermanentMalfunctions[0] : ""
        hasShownMaxRegularAlert = false
        hasShownMaxPermanentAlert = false
    }
    
    private func disableAddMalfunctionButton() -> Bool {
        if isPermanent {
            return malfunctionDescription.isEmpty
        } else {
            return malfunctionDescription.isEmpty || malfunctionRemovalCondition.isEmpty
        }
    }
    
    private func isTooManyPermanentMalfunctions() -> Bool {
        malfunctions.filter( { $0.malfunctionType == .permanent }).count == 5
    }
    
    private func isTooManyRegularMalfunctions() -> Bool {
        malfunctions.filter( { $0.malfunctionType == .normal }).count == 2
    }
}

#Preview {
    AddMalfunctionsView(malfunctions: .constant([Malfunction]()))
}
