//
//  FunctionLibrary.swift
//  Sine Demo
//
//  Created by Vegard Solheim Theriault on 09/03/2017.
//  Copyright © 2017 Vegard Solheim Theriault. All rights reserved.
//

import Foundation

public func sawtooth(harmonies: Int = 10, fundamentalFrequency: Double = 0.2) -> [Circle] {
    // sin(x) + (1⁄2)*sin(2x) + (1⁄3)*sin(3x) + ... + (1/n)*sin(nx)
    return stride(from: 1.0, through: Double(harmonies), by: 1).map {
        Circle(radius: 1/$0, frequency: $0 * fundamentalFrequency)
    }
}

public func square(harmonies: Int = 10, fundamentalFrequency: Double = 0.2) -> [Circle] {
    // sin(x) + (1/3)*sin(3x) + (1/5)*sin(5x) + ... + (1/(n*2-1))*sin((n*2-1)*x)
    return stride(from: 1.0, through: Double(harmonies*2-1), by: 2).map {
        Circle(radius: 1/$0, frequency: $0 * fundamentalFrequency)
    }
}

public func triangle(harmonies: Int = 10, fundamentalFrequency: Double = 0.2) -> [Circle] {
    // sin(x) - (1/9)*sin(3x) + (1/25)*sin(5x) - ... + (1/(n*2-1)^2)*sin((n*2-1)*x)
    return stride(from: 1.0, through: Double(harmonies*2-1), by: 2).map {
        let phaseShift = ((($0+1)/2).truncatingRemainder(dividingBy: 2) + 1) * .pi
        return Circle(
            radius: 1/pow($0,2),
            frequency: $0 * fundamentalFrequency,
            phaseShift: phaseShift
        )
    }
}
