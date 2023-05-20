//
//  Hexagon.swift
//  ED_ENT
//
//  Created by Robin PETIT on 02/05/2023.
//

import SwiftUI

struct Hexagon: Shape {
    var width:CGFloat = 50
    var height:CGFloat = 50
    var hex:CGRect = CGRect(x: 0, y: 0, width: 50, height: 50)
    init (width:CGFloat, height:CGFloat){
        hex = CGRect(x: 0, y: 0, width: width, height: height)
        self.width=width
        self.height=height
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.size.height, rect.size.width) / 2
        let corners = corners(center: center, radius: radius)
        path.move(to: corners[0])
        corners[1...5].forEach() { point in
            path.addLine(to: point)
        }
        path.closeSubpath()
        _ = path.frame(width: self.width, height: self.height)
        return path
    }
    
    func corners(center: CGPoint, radius: CGFloat) -> [CGPoint] {
        var points: [CGPoint] = []
        for i in (0...5) {
            let angle = CGFloat.pi / 3 * CGFloat(i)
            let point = CGPoint(
                x: center.x + radius * cos(angle),
                y: center.y + radius * sin(angle)
            )
            points.append(point)
        }
        return points
    }
}
