//
//  Utils.swift
//  Sine Demo
//
//  Created by Vegard Solheim Theriault on 07/03/2017.
//  Copyright © 2017 Vegard Solheim Theriault. All rights reserved.
//

import UIKit

func graphPath(from circles: [Circle],
               in rect: CGRect,
               withRadiusMultiplier radiusMultiplier: CGFloat,
               periodsToDraw periods: Double,
               lineWidth: CGFloat) -> UIBezierPath
{
    let values = generateGraphValues(from: circles, count: 1000, periods: periods)
    
    let dx = rect.width / CGFloat(values.count)
    let dy = radiusMultiplier
    
    let path = UIBezierPath()
    path.lineWidth = lineWidth
    path.lineCapStyle = .round
    path.lineJoinStyle = .round
    
    for i in 0..<values.count {
        let point = CGPoint(
            x: rect.origin.x + CGFloat(i) * dx,
            y: rect.origin.y + rect.height / 2 - CGFloat(values[i]) * dy
        )
        if i == 0 { path.move(to: point) }
        else { path.addLine(to: point) }
    }
    
    return path
}

func generateGraphValues(from circles: [Circle],
                         count: Int,
                         periods: Double) -> [CGFloat]
{
    var output = [CGFloat]()
    
    let maxX = (2 * .pi * periods) / circles[0].frequency
    for x in stride(from: 0.0, to: maxX, by: maxX / Double(count)) {
        let value = circles.reduce(0.0) { $0 + $1.radius * sin($1.frequency * x + $1.phaseShift) }
        output.append(CGFloat(value))
    }
    
    return output
}
