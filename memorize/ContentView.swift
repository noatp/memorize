//
//  ContentView.swift
//  memorize
//
//  Created by Toan Pham on 8/17/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["😃", "😅", "🥳", "🧐"]
    var body: some View {
        HStack{
            ForEach(emojis, id: \.self, content: { emoji in
                CardView(content: emoji)
            })
        }
        .padding(.horizontal)
    }
}

struct CardView: View{
    @State var isFaceUp = true
    var content: String
    
    var body: some View{
        ZStack{
            let cardShape = RoundedRectangle(cornerRadius: 25.0)
            if(isFaceUp){
                cardShape.stroke(Color.green, lineWidth: 3)
                cardShape.fill(Color.white)
                Text(content).font(.largeTitle)
            }
            else{
                cardShape.fill(Color.green)
            }
            
        }
        .onTapGesture{
            isFaceUp = !isFaceUp
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
