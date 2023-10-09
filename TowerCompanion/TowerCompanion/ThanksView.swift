//
//  ThanksView.swift
//  TowerCompanion
//
//  Created by Justin on 9/20/23.
//

import SwiftUI

struct ThanksView: View {
    
    var didTapClose: () -> ()
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Thank You!")
                .font(.system(.title2, design: .rounded).bold())
                .multilineTextAlignment(.center)
            
            Text("Thanks for supporting the Tower Companion app!")
                .font(.system(.body, design: .rounded))
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
            
            Button(action: didTapClose) {
                Text("Close")
                    .font(.system(.title3, design: .rounded).bold())
                    .tint(.white)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.blue, in: RoundedRectangle(cornerRadius: 10,
                                                            style: .continuous))
            }
        }
        .padding(16)
        .background(.black, in: RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal, 8)
    }
}

//#Preview {
//    ThanksView(didTapClose: ))
//}
