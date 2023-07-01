//
//  AddMalfunctionView.swift
//  TowerCompanion
//
//  Created by Justin on 7/1/23.
//

import SwiftUI

struct AddMalfunctionView: View {
    @Binding var malfunctions: [Malfunction]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    

}

#Preview {
    AddMalfunctionView(malfunctions: .constant([Malfunction]()))
}
