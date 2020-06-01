//
//  MemoryGame.swift
//  architecturelearning
//
//  Created by Ethan Uzarowski on 6/1/20.
//  Copyright © 2020 Ethan Uzarowski. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        print("card chosen: \(card)")
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactoy: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactoy(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))

        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
    
}
