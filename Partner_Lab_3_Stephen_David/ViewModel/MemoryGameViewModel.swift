//
// Partner Lab 3
// Stephen David
// Date: 2025-11-03
//

import SwiftUI

class MemoryGameViewModel: ObservableObject {
    @Published private(set) var cards: [Card] = []
    
    private let emojis = ["🐶", "🐱", "🐻", "🐼", "🐸", "🦊"]
    
    private var indexOfFlippedCard: Int?
    
    init() {
        setupGame()
    }
    
    func setupGame() {
        let selected = emojis.shuffled().prefix(6)
        let paired = (selected + selected).shuffled()
        cards = paired.map { Card(content: $0) }
    }
    
    func flipCard(_ card: Card) {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return }
        
        // Game logic: match two flipped cards
        if let matchIndex = indexOfFlippedCard, matchIndex != index {
            if cards[matchIndex].content == cards[index].content {
                cards[matchIndex].isMatched = true
                cards[index].isMatched = true
            }
            indexOfFlippedCard = nil
        } else {
            for i in cards.indices {
                if !cards[i].isMatched {
                    cards[i].isFlipped = false
                }
            }
            indexOfFlippedCard = index
        }
        
        withAnimation(.easeInOut(duration: 0.5)) {
            cards[index].isFlipped.toggle()
        }
    }
}

