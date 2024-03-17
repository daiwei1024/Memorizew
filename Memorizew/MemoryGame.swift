//
//  MemoryGame.swift
//  Memorizew
//
//  Created by 朱大伟 on 2023/12/12.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable{
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCard: Int, creater: (Int)-> CardContent) {
        cards = []
        for index in 0..<max(2, numberOfPairsOfCard){
            let content = creater(index)
            cards.append(Card(content: content, id: "\(index+1)a"))
            cards.append(Card(content: content, id: "\(index+1)b"))
        }
    }
    
    mutating func shuffle(){
        cards.shuffle()
        print(cards)
    } 
    
    mutating func choose(_ card: Card){
        if let chooseIndex = cards.firstIndex(where: { $0.id == card.id }){
            if !cards[chooseIndex].isFaceUp && !cards[chooseIndex].isMatched{
                if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                    if cards[chooseIndex].content == cards[potentialMatchIndex].content{
                        cards[chooseIndex].isMatched = true
                        cards[potentialMatchIndex].isMatched = true
                    }
                }else{
                    indexOfTheOneAndOnlyFaceUpCard = chooseIndex
                }
                cards[chooseIndex].isFaceUp = true
            }
        }
    }
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{
            let faceUpIndices = cards.indices.filter{ index in cards[index].isFaceUp }
            return faceUpIndices.count == 1 ? faceUpIndices.first : nil
        }
        set{
            cards.indices.forEach{ cards[$0].isFaceUp = (newValue == $0) }
        }
    }
    
    //当内部元素都behavior like Equatable 时，可以不用实现这个协议
    struct Card : Equatable, Identifiable, CustomDebugStringConvertible{
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        
        var id: String
        var debugDescription: String{
            "\(id): \(content) \(isFaceUp ? "up" : "down")\(isMatched ? "matched" : "")"
        }
    }
}
