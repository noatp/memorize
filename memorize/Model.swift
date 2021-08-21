//
//  Model.swift
//  memorize
//
//  Created by Toan Pham on 8/20/21.
//

import Foundation

struct GameModel{
    private(set) var cards: [Card] = []
    private var currentFaceUpCardIndex: Int? = nil
    
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
            if let firstFaceUpCardIndex = currentFaceUpCardIndex{
                if (tappedCard.cardContent == cards[firstFaceUpCardIndex].cardContent)
                {
                    cards[tappedCardIndex].isMatched = true
                    cards[firstFaceUpCardIndex].isMatched = true
                }
                currentFaceUpCardIndex = nil
            }
            else{
                for cardIndex in cards.indices{
                    cards[cardIndex].isFaceUp = false
                }
                currentFaceUpCardIndex = tappedCardIndex
            }
            cards[tappedCardIndex].isFaceUp.toggle()
        }
    }
}




//struct MemoryGameModel<CardContent>{
//    private (set) var cards: Array<Card>
//    
//    mutating func tapCard(card: Card){
//        cards[card.id].isFaceUp.toggle()
//    }
//    
//    init(
//        numberOfPairs: Int,
//        generateCardContent: (Int) -> CardContent
//    ){
//        cards = Array<Card>()
//        for index in 0..<numberOfPairs{
//            let content: CardContent = generateCardContent(index)
//            cards.append(Card(cardContent: content, id: index*2))
//            cards.append(Card(cardContent: content, id: index*2+1))
//        }
//    }
//    
//    struct Card: Identifiable{
//        var cardContent: CardContent
//        var isFaceUp: Bool = false
//        var isMatched: Bool = false
//        var id: Int
//    }
//}


