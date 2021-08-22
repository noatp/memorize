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

