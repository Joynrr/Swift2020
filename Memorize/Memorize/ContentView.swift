//
//  ContentView.swift
//  Memorize
//
//  Created by Qiaonan Tao on 8/17/20.
//  Copyright © 2020 CS193p Joynrr. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        return HStack{
//            Text("hello") add one more column
            ForEach(0..<4) { index in
                CardView(isFaceUp: false)
            }
        }
            .padding()
            .foregroundColor(Color.orange)
            .font(Font.largeTitle)
    
    }
}

struct CardView: View {
    var isFaceUp: Bool 
    var body: some View{
        ZStack{
            if isFaceUp{
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3)// Override ZStack Color value
                Text("👻")
            }else{
                RoundedRectangle(cornerRadius: 10.0).fill()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
