//
// Partner Lab 3
// Stephen David
// Date: 2025-11-03
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MemoryGameViewModel()
    
    var body: some View {
        VStack {
            Text("Memory Game")
                .font(.title)
                .padding()
            
            let columns = [
                GridItem(.flexible()),
                GridItem(.flexible()),
                GridItem(.flexible())
            ]
            
            LazyVGrid(columns: columns, spacing: 10) {
                ForEach(viewModel.cards) { card in
                    CardView(card: card)
                        .onTapGesture {
                            viewModel.flipCard(card)
                        }
                }
            }
            .padding()
            
            Button("Reset Game") {
                withAnimation(.spring()) {
                    viewModel.setupGame()
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
