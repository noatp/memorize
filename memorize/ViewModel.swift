//
//  ViewModel.swift
//  memorize
//
//  Created by Toan Pham on 8/20/21.
//

import Foundation


class GameViewModel: ObservableObject{
    @Published private var gameModel = GameModel()
        
    init(){
        gameModel.useCaseInitCards()
    }
    
    var cards: [GameModel.Card] {return gameModel.cards}
    
    func tapCard(tappedCard: GameModel.Card){
        gameModel.useCaseTap(card: tappedCard)
    }
}

//class GameViewModel: ObservableObject{
//    static let emojis = ["😃", "😅", "🥳", "🧐", "🤨", "😵", "😪", "😵‍💫", "🤐", "🤢", "😷", "🙄", "😱", "😡", "🤬"]
//    
//    static func generateCardContent(index: Int) -> String{
//        return emojis[index]
//    }
//    
//    @Published private var memoryGameModel: MemoryGameModel<String> = MemoryGameModel(
//        numberOfPairs: 10,
//        generateCardContent: generateCardContent
//    )
//    
//    var cards: Array<MemoryGameModel<String>.Card>{
//        return memoryGameModel.cards
//    }
//    
//    func onTapCard(card: MemoryGameModel<String>.Card){
//        memoryGameModel.tapCard(card: card)
//    }
//}
