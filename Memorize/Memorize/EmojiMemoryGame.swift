//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Qiaonan Tao on 8/17/20.
//  Copyright © 2020 CS193p Joynrr. All rights reserved.
//

import SwiftUI

/*
   View Model:
        1. Portal between View and Model
        2. class easy to share, pointer lives in heap
        
 
 */

class EmojiMemoryGame {
    private var model1: MemoryGame<String> =
        MemoryGame<String>(numberPairsOfCard: 2, cardContentFactory:{ (pairIndex: Int) -> String in
            return "👻"
    })
    
    // Swift can infer the type, so dont need to say, pairIndex is Int and the return is String
    private var model2: MemoryGame<String> =
        MemoryGame<String>(numberPairsOfCard: 2, cardContentFactory:{ (pairIndex) in
            return "👻"
    })
    
    // last argument could omit the keyword
    // para doesn't need, like pairIndex, could just use _ to replace
    private var model3: MemoryGame<String> =
        MemoryGame<String>(numberPairsOfCard: 2){ _ in"👻"}
    
    private(set) var model: MemoryGame<String> = EmojiMemoryGame.createEmojiMemoryGame()
    static func createEmojiMemoryGame() -> MemoryGame<String>{
        let emojis: Array<String> = ["👻","🥶","😚","😢"]
        return MemoryGame<String>(numberPairsOfCard: emojis.count) {pairIndex in
            return emojis[pairIndex]}
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }

    // MARK : - Intent(s)
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
   
}
