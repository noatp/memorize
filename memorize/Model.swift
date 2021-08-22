//
//  Model.swift
//  memorize
//
//  Created by Toan Pham on 8/20/21.
//

import Foundation

struct GameModel{
    private(set) var cards: [Card] = []
    private var theOnlyFaceUpCardIndex: Int?{
        get{ cards.indices.filter { index in cards[index].isFaceUp }.oneAndOnlyOne }
        set{ cards.indices.forEach { index in cards[index].isFaceUp = (newValue == index)} }
    }
    
    
    struct ContentPool{
        static var emojis = ["😃", "😅", "🥳", "🧐", "🤨", "😵", "😪", "😵‍💫", "🤐", "🤢", "😷", "🙄", "😱", "😡", "🤬"]
    }

    struct Card: Identifiable{
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var cardContent: String
        var id: String
    }
    
    mutating func useCaseInitCards(){
        cards = ContentPool.emojis
            .shuffled()
            .prefix(10)
            .flatMap { emoji in
                [Card(cardContent: emoji, id: UUID().uuidString),
                 Card(cardContent: emoji, id: UUID().uuidString)]
            }
            .shuffled()
    }
    
    mutating func useCaseTap(card tappedCard: Card){
        if let tappedCardIndex = cards.firstIndex(where: { card in card.id == tappedCard.id }),
           !tappedCard.isMatched,
           !tappedCard.isFaceUp
        {
            if let firstFaceUpCardIndex = theOnlyFaceUpCardIndex{
                if (tappedCard.cardContent == cards[firstFaceUpCardIndex].cardContent)
                {
                    cards[tappedCardIndex].isMatched = true
                    cards[firstFaceUpCardIndex].isMatched = true
                }
                cards[tappedCardIndex].isFaceUp = true
            }
            else{
                theOnlyFaceUpCardIndex = tappedCardIndex
            }
        }
    }
}


extension Array{
    var oneAndOnlyOne: Element? {
        if (count == 1){
            return first
        }
        else{
            return nil
        }
    }
}
