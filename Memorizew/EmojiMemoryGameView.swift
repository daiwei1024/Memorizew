//
//  ContentView.swift
//  Memorizew
//
//  Created by 朱大伟 on 2023/12/10.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    private let aspectRatio: CGFloat = 2/3
    private let spacing: CGFloat = 4
    
    var body: some View {
        VStack{
            cards
                .foregroundStyle(viewModel.color)
            Button("Shuffle") {
                withAnimation(.easeInOut(duration: 2)) {
                    viewModel.shuffle()
                }
            }
        }
        .padding()
    }
    
    var cards: some View{
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio){ card in
            VStack{
                CardView(card: card)
                    .padding(spacing)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 2)){
                            viewModel.choose(card)
                        }
                    }
//                Text(card.id)
            }
        }
        .foregroundColor(viewModel.color)
    }
}

#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
