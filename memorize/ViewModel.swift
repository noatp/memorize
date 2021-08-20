//
//  ViewModel.swift
//  memorize
//
//  Created by Toan Pham on 8/20/21.
//

import Foundation


class GameViewModel{
    static let emojis = ["😃", "😅", "🥳", "🧐", "🤨", "😵", "😪", "😵‍💫", "🤐", "🤢", "😷", "🙄", "😱", "😡", "🤬"]
    
    static func generateCardContent(index: Int) -> String{
        return emojis[index]
    }
    
    private var memoryGameModel: MemoryGameModel<String> = MemoryGameModel(
        numberOfPairs: 5,
        generateCardContent: generateCardContent
    )
    
    var cards: Array<MemoryGameModel<String>.Card>{
        return memoryGameModel.cards
    }
}
