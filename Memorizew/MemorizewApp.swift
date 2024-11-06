//
//  MemorizewApp.swift
//  Memorizew
//
//  Created by 朱大伟 on 2023/12/10.
//

import SwiftUI

@main
struct MemorizewApp: App {
    @StateObject var model = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModel: model)
        }.defaultSize(width: 600, height: 400)
    }
}
