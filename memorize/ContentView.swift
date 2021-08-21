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
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                ForEach(gameViewModel.cards){ card in 
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                        .onTapGesture {gameViewModel.tapCard(tappedCard: card)}
                }
            }
            .padding()
        })
    }
}

struct CardView: View{
    let card: GameModel.Card
    
    var body: some View{
        ZStack{
            let cardShape = RoundedRectangle(cornerRadius: 25.0)
            if(card.isMatched){
                cardShape.stroke(Color.green, lineWidth: 3)
                cardShape.fill(Color.white)
                Text(card.cardContent).font(.largeTitle)
                cardShape.fill(Color.white.opacity(0.7))
            }
            else{
                if(card.isFaceUp){
                    cardShape.stroke(Color.green, lineWidth: 3)
                    cardShape.fill(Color.white)
                    Text(card.cardContent).font(.largeTitle)
                }
                else{
                    cardShape.fill(Color.green)
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
