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
       cards.shuffle()
    }
    
    mutating func choose(card: Card){
        print("card chosen: \(card)")
        /*
            always is copy in struct
            self connot be changed, unless add mutating keyword
         */
        let chosenIndex: Int = self.index(of:card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func index(of card: Card) -> Int{
        for index in 0..<self.cards.count{
            if self.cards[index].id == card.id{
                return index
            }
        }
        return -1  // TODO: bogus !
       
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
        
    }
    
}
