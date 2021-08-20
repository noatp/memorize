//
//  Model.swift
//  memorize
//
//  Created by Toan Pham on 8/20/21.
//

import Foundation

struct MemoryGameModel<CardContent>{
    private (set) var cards: Array<Card>
    
    func tapCard(card: Card){
        
    }
    
    init(
        numberOfPairs: Int,
        generateCardContent: (Int) -> CardContent
        ){
        cards = Array<Card>()
        for index in 0..<numberOfPairs{
            let content: CardContent = generateCardContent(index)
            cards.append(Card(cardContent: content, id: index*2))
            cards.append(Card(cardContent: content, id: index*2+1))
        }
    }
    
    struct Card: Identifiable{
        var cardContent: CardContent
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var id: Int
    }
}


