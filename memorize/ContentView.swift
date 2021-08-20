//
//  ContentView.swift
//  memorize
//
//  Created by Toan Pham on 8/17/21.
//

import SwiftUI

struct ContentView: View {
    
    let gameViewModel = GameViewModel()
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
            LazyVGrid(columns: [GridItem(.adaptive(minimum:80))]){
                ForEach(gameViewModel.cards){ card in
                    CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                }
            }
            .padding()
        })
    }
}

struct CardView: View{
    let card: MemoryGameModel<String>.Card
    
    var body: some View{
        ZStack{
            let cardShape = RoundedRectangle(cornerRadius: 25.0)
            if(!card.isFaceUp){
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


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        ContentView()
    }
}
