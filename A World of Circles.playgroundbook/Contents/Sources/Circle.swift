//
//  Circle.swift
//  Sine Demo
//
//  Created by Vegard Solheim Theriault on 08/03/2017.
//  Copyright © 2017 Vegard Solheim Theriault. All rights reserved.
//

import UIKit

@objc public class Circle: NSObject {
    public   var radius     : Double
    public   var frequency  : Double
    internal var rotation   : Double
    internal let phaseShift : Double
    
    public init(radius: Double = 1, frequency: Double = 1) {
        self.radius     = radius
        self.frequency  = frequency
        self.phaseShift = 0 
        self.rotation   = 0
    }
    
    internal init(radius: Double, frequency: Double, phaseShift: Double) {
        self.radius     = radius
        self.frequency  = frequency
        self.phaseShift = phaseShift
        self.rotation   = 0
    }
    
    internal func rotate(withDelta delta: TimeInterval) {
        rotation += 2 * .pi * delta * frequency
    }
    
    func debugQuickLookObject() -> AnyObject {
        let size = CGSize(width: 200, height: radius * 50)
        let duration = 4.0 // seconds
        
        return graphPath(from: [self],
                           in: CGRect(origin: .zero, size: size),
         withRadiusMultiplier: 50,
                periodsToDraw: duration * frequency,
                    lineWidth: 1
        )
    }
}
