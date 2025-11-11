//
// Partner Lab 3
// Stephen David
// Date: 2025-11-03
//

import SwiftUI

struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            if card.isFlipped || card.isMatched {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .overlay(Text(card.content).font(.largeTitle))
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.blue)
                    .transition(.asymmetric(insertion: .opacity, removal: .scale))
            }
        }
        .frame(width: 70, height: 100)
        .shadow(radius: 3)
        .rotation3DEffect(
            .degrees(card.isFlipped ? 180 : 0),
            axis: (x: 0, y: 1, z: 0)
        )
        .animation(.spring(), value: card.isFlipped)
    }
}

