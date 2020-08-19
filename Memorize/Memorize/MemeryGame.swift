//
//  MemeryGame.swift
//  Memorize
//
//  Created by Qiaonan Tao on 8/17/20.
//  Copyright © 2020 CS193p Joynrr. All rights reserved.
//

import Foundation
// Independent Thing
struct MemoryGame<CardContent>{
    var cards: Array<Card>
    
    init(numberPairsOfCard: Int, cardContentFactory: (Int)-> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberPairsOfCard{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
            
    }
    
    func choose(card: Card){
        print("card chosen: \(card)")
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
    
}
