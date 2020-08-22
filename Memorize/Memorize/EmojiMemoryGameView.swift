//
//  ContentView.swift
//  Memorize
//
//  Created by Qiaonan Tao on 8/17/20.
//  Copyright © 2020 CS193p Joynrr. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
   @ObservedObject var viewModel: EmojiMemoryGame
    /*
     every time it changed, will redrawn as well
     */
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
    
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View{
        GeometryReader(content: {geometry in
            self.body(for: geometry.size)
//            ZStack{
//                if self.card.isFaceUp{
//                    RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
//                    RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth)// Override ZStack Color value
//                    Text(self.card.content)
//                      }else{
//                    RoundedRectangle(cornerRadius: self.cornerRadius).fill()
//                      }
//
//                  }
//            .font(Font.system(size: min(geometry.size.width,geometry.size.height) * self.fontScaleFactor))

        })
      
    }
    
    func body(for size:CGSize) -> some View{
        ZStack{
            if card.isFaceUp{
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)// Override ZStack Color value
                Text(card.content)
            }else{
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            }

        }
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drwing Constants
    
    let cornerRadius: CGFloat = 10.0
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75
    func fontSize(for size:CGSize) -> CGFloat{
        min(size.width,size.height) * fontScaleFactor
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
