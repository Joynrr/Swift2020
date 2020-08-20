//
//  ContentView.swift
//  Memorize
//
//  Created by Qiaonan Tao on 8/17/20.
//  Copyright © 2020 CS193p Joynrr. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame

    var body: some View {
        return HStack{
//            Text("hello") add one more column
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card:card)
                }
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.title)
    
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)// Override ZStack Color value
                Text(card.content)
            }else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
