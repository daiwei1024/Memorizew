//
//  CardView.swift
//  Memorizew
//
//  Created by 朱大伟 on 2024/3/17.
//

import SwiftUI

struct CardView: View{
    //创建了一个指针 指针的地址还是不变的，只是内容变化了
//    @State var isFaceUp = true
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    var body: some View{
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay{
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
                    .rotationEffect(.degrees(card.isMatched ? 360 : 0))
                    .animation(.linear(duration: 1).repeatForever(autoreverses:false), value: card.isMatched)
            }
            .padding(Constants.Pie.inset)
            .cardify(isFaceup: card.isFaceUp)
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.5
            static let inset: CGFloat = 5
        }
    }
}

#Preview {
    VStack{
        HStack{
            CardView(card: CardView.Card(content: "😱", id: "Test1"))
                .aspectRatio(3/4, contentMode: .fit)
            CardView(card: CardView.Card(content: "😱", id: "Test2"))
                .aspectRatio(3/4, contentMode: .fit)
        }
        HStack{
            CardView(card: CardView.Card(isFaceUp: true, content: "😱", id: "Test3"))
                .aspectRatio(3/4, contentMode: .fit)
            CardView(card: CardView.Card(content: "😱", id: "Test4"))
                .aspectRatio(3/4, contentMode: .fit)
        }
        
    }
    .foregroundStyle(Color.red)
}
