//
//  AspectVGrid.swift
//  Memorizew
//
//  Created by 朱大伟 on 2024/3/7.
//

import SwiftUI

struct AspectVGrid<Item:Identifiable, ItemView:View>: View {
    
    var items: [Item]
    var itemView: (Item)->ItemView
    let aspectRatio: CGFloat
    
    init(_ items: [Item], aspectRatio: CGFloat, @ViewBuilder itemView: @escaping (Item)->ItemView) {
        self.items = items
        self.itemView = itemView
        self.aspectRatio = aspectRatio
    }
    
    
    var body: some View {
        GeometryReader{geometry in
            let width = gridItemWidthThatFits(count: items.count, size: geometry.size, aspectRatio: aspectRatio)
            LazyVGrid(columns: [GridItem(.adaptive(minimum: width), spacing: 0), ], spacing: 0){
                ForEach(items){item in
                    itemView(item)
                        .aspectRatio(aspectRatio, contentMode: .fit)
                }
            }
        }
    }
    
    func gridItemWidthThatFits(count: Int, size: CGSize, aspectRatio: CGFloat) -> CGFloat{
        let count = CGFloat(count)
        var columCount = 1.0
        repeat{
            let width = (size.width / columCount).rounded(.down)
            let rowCount = (count / columCount).rounded(.up)
            let height = width / aspectRatio
            if(rowCount * height < size.height){
                return width
            }
            columCount += 1
        }while columCount < count
        return min(size.width / count, size.height * aspectRatio).rounded(.down)
    }
}

//#Preview {
//    AspectVGrid()
//}
