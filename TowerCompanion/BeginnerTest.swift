//
//  BeginnerTest.swift
//  TowerCompanion
//
//  Created by Justin on 3/19/24.
//

import SwiftUI

struct BeginnerTest: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Views & Modifiers")
                .font(.largeTitle)
            
            Text("Concepts")
                .font(.title)
                .foregroundStyle(.gray)
            
            Text("Building a UI with SwiftUI consists of using Views and Modifiers. Traditional methods used controls and properties. With SwiftUI, you add a view and then set properties with modifiers")
                .font(.title)
                .background(.orange)
                .foregroundStyle(.black)
            
            Button("Button With Shadow", action: {
                print("Do things")
            })
            .padding()
            .font(.title)
            .foregroundStyle(.white)
            .background(.orange)
            .cornerRadius(5)
            .shadow(radius: 10)
            
        }
    }
}

#Preview {
    BeginnerTest()
}
