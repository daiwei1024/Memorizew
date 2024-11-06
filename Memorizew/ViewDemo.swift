//
//  ViewDemo.swift
//  Memorizew
//
//  Created by 朱大伟 on 2024/3/7.
//

import SwiftUI

struct ViewDemo: View {
    let rows = [
            GridItem(.fixed(30), spacing: 1),
            GridItem(.fixed(60), spacing: 10),
            GridItem(.fixed(90), spacing: 20),
            GridItem(.fixed(10), spacing: 50)
        ]


        var body: some View {
            ScrollView(.horizontal) {
                LazyHGrid(rows: rows, spacing: 5) {
                    ForEach(0...1, id: \.self) { _ in
                        Color.red.frame(width: 30)
                        Color.yellow.frame(width: 30)
                        Color.green.frame(width: 30)
                        Color.blue.frame(width: 30)
                        
                    }
                }
            }
        }
}

#Preview {
    ViewDemo()
}
