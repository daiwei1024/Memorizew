//
//  Pie.swift
//  Memorizew
//
//  Created by 朱大伟 on 2024/3/17.
//

import SwiftUI
import CoreGraphics

struct Pie: Shape{
    var startAngle: Angle = .zero
    var endAngle: Angle
    var clockwise: Bool = true
    
    func path(in rect: CGRect) -> Path {
        let startAngle = startAngle - .degrees(90)
        let endAngle = endAngle - .degrees(90)
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(startAngle.radians),
            y: center.y + radius * sin(startAngle.radians)
        )
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        //ios 中顺时针是逆时针！
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: !clockwise)
        p.addLine(to: center)
        
        return p
    }
    
    
}
