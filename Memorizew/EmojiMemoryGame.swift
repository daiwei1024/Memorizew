//
//  EmojiMemoryGame.swift
//  Memorizew
//
//  Created by 朱大伟 on 2023/12/12.
//

import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject{
    typealias Card = MemoryGame<String>.Card
    
    private static let emojis = ["😱","😶‍🌫️","😀","🤣","☺️","😇","🤩","👤","😈","🐶","👻","🤡","👽","💩"]
    
    private static func createGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCard: 4){ index in
            if emojis.indices.contains(index){
                return emojis[index]
            }else{
                return "﹖"
            }
            
        }
    }
    
    @Published private var model = createGame()
    
    var cards: Array<Card>{
        return model.cards
    }
    
    func choose(_ card: Card){
        model.choose(card)
        print("click choose")
    }
    
    var color: Color{
        .orange
    }
    
    func shuffle(){
        model.shuffle()
    }
}
