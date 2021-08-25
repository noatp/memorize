//
//  ContentView.swift
//  memorize
//
//  Created by Toan Pham on 8/17/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var gameViewModel = GameViewModel()
    
    var body: some View {
        AspectVGrid(items: gameViewModel.cards, aspectRatio: 2/3){ card in
            CardView(card: card)
                .padding(4)
                .onTapGesture {gameViewModel.tapCard(tappedCard: card)}
        }
        .padding()
    }
}

struct CardView: View{
    let card: GameModel.Card
    
    var body: some View{
        GeometryReader{ geometry in
            ZStack{
                let cardShape = RoundedRectangle(cornerRadius: 25.0)
                if(card.isMatched){
                    cardShape.stroke(Color.green, lineWidth: 3)
                    cardShape.fill(Color.white)
                    Text(card.cardContent).font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.8))
                    cardShape.fill(Color.white.opacity(0.7))
                }
                else{
                    if(card.isFaceUp){
                        cardShape.stroke(Color.green, lineWidth: 3)
                        cardShape.fill(Color.white)
                        Text(card.cardContent).font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.8))
                    }
                    else{
                        cardShape.fill(Color.green)
                    }
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
    }
}
