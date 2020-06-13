//
//  EmojiMemoryGame.swift
//  architecturelearning
//
//  Created by Ethan Uzarowski on 6/1/20.
//  Copyright © 2020 Ethan Uzarowski. All rights reserved.

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    var theme = Theme.getRandomTheme()
    @Published private var model: MemoryGame<String>
    
    init() {
        theme = Theme.getRandomTheme()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCards ?? Int.random(in: 2...5)) { pairIndex in
            return theme.emojis[pairIndex]
        }
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var score: Int {
        model.score
    }
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
    
    func newGame() {
        theme = Theme.getRandomTheme()
        model = EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}

struct Theme {
    let name: String
    let emojis: [String]
    let numberOfPairsOfCards: Int?
    let color: Color
    
    static func getRandomTheme() -> Theme {
        [
            Theme(name: "Halloween", emojis: ["👻", "🎃", "🕷", "👽", "🦇"], numberOfPairsOfCards: nil, color: Color.orange),
            Theme(name: "Faces", emojis: ["😀", "😇", "😍", "🤪", "😳"], numberOfPairsOfCards: nil, color: Color.red),
            Theme(name: "Animals", emojis: ["🐙", "🐘", "🦒", "🐊", "🐇"], numberOfPairsOfCards: nil, color: Color.yellow),
            Theme(name: "Plants", emojis: ["🌲", "🌼", "🌸", "🌹", "🌵"], numberOfPairsOfCards: nil, color: Color.blue),
            Theme(name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🏄‍♂️"], numberOfPairsOfCards: nil, color: Color.purple),
            Theme(name: "Demons", emojis: ["😈", "👿"], numberOfPairsOfCards: 2, color: Color.black)
        ].randomElement()!
    }
}
