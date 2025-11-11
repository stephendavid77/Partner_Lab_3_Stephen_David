//
// Partner Lab 3
// Stephen David
// Date: 2025-11-03
//

import Foundation

struct Card: Identifiable {
    let id = UUID()
    let content: String
    var isFlipped = false
    var isMatched = false
}
