//
//  Cardify.swift
//  Memorizew
//
//  Created by 朱大伟 on 2024/3/17.
//

import SwiftUI
//实现Animatable能够禁止自动的animation，自己接管动画
struct Cardify: ViewModifier, Animatable {
    init(isFaceUp: Bool) {
        self.rotation = isFaceUp ? 0 : 180
    }
    
    var rotation: Double
    
    var animatableData: Double{
        get {rotation}
        set {rotation = newValue}
    }
    
    var isFaceUp: Bool{
        rotation < 90
    }
    
    func body(content: Content) ->some View {
        ZStack(alignment: .center){
            let base = RoundedRectangle(cornerRadius:Constants.cornerRadius)
            base.strokeBorder(lineWidth: Constants.lineWidth)
                .background(base.fill(.white))
                .overlay(content)
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .rotation3DEffect(
            .degrees(rotation),axis: (0, 1, 0)
        )
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
    }
}

extension View{
    func cardify(isFaceup: Bool) -> some View{
        modifier(Cardify(isFaceUp: isFaceup))
    }
}

