//
//  CirclesView.swift
//  Sine Demo
//
//  Created by Vegard Solheim Theriault on 09/03/2017.
//  Copyright © 2017 Vegard Solheim Theriault. All rights reserved.
//

import UIKit

public class CirclesView: UIView {
    
    
    public   var radiusMultiplier: CGFloat = 1
    public   var circles = [Circle]()
    public   var shouldDrawMarker = true
    public   var periodsToDraw = 2.0
    internal var graphStartX: CGFloat = 0
    internal var graphEndX: CGFloat = 1
    public   var circlesCenterX: CGFloat = 0
    
    private var displayLink: CADisplayLink?
    private var duration = 0.0
    
    
    
    
    // -------------------------------
    // MARK: Initialization
    // -------------------------------
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        isOpaque = false
        backgroundColor = .clear
        contentMode = .redraw
        
        displayLink = CADisplayLink(target: self, selector: #selector(renderLoop))
        displayLink?.add(to: .main, forMode: .defaultRunLoopMode)
    }
    
    func reset() {
        duration = 0
    }
    
    
    
    
    // -------------------------------
    // MARK: Drawing
    // -------------------------------
    
    @objc private func renderLoop() {
        guard circles.count > 0 else { return }
        guard let delta = displayLink?.duration else { return }
        
        // Update circles
        for i in 0..<circles.count {
            circles[i].rotate(withDelta: delta)
        }
        
        duration += delta
        
        // If we've done one full round, reset all the circles.
        // If they're not all harmonies of the root circle, they
        // would get out of sync otherwise.
        if duration > (1/circles[0].frequency) * periodsToDraw {
            duration = 0
            
            for i in 0..<circles.count {
                circles[i].rotation = 0
            }
        }
        
        // Re-draw
        setNeedsDisplay()
    }
    
    public override func draw(_ rect: CGRect) {
        var circlesCenter = CGPoint(x: circlesCenterX * bounds.width, y: bounds.midY)
        
        var whiteLevel: CGFloat = 0.5
        let whiteLevelDelta = 0.4 / CGFloat(circles.count)
        for circle in circles {
            circlesCenter = draw(
                circle: circle,
                at: circlesCenter,
                with: UIColor(white: 0, alpha: whiteLevel)
            )
            whiteLevel -= whiteLevelDelta
        }
        
        if shouldDrawMarker {
            drawGraphMarker(from: circlesCenter)
        }
    }
    
    private func draw(circle: Circle, at point: CGPoint, with color: UIColor) -> CGPoint {
        color.setStroke()
        
        let radius = CGFloat(circle.radius) * radiusMultiplier
        let centerDotRadius: CGFloat = -pow(radius - 100, 2) * 0.0007 + 7
        
        // Circumference
        let circumferenceFrame = CGRect(
            x: point.x - radius,
            y: point.y - radius,
            width: radius * 2,
            height: radius * 2
        )
        let circumference = UIBezierPath(ovalIn: circumferenceFrame)
        circumference.lineWidth = radius * 0.015 + 1.5
        circumference.stroke()
        
        // Center
        let centerDotFrame = CGRect(
            x: point.x - centerDotRadius,
            y: point.y - centerDotRadius,
            width: centerDotRadius * 2,
            height: centerDotRadius * 2
        )
        let centerDot = UIBezierPath(ovalIn: centerDotFrame)
        centerDot.fill()
        
        // Rod
        UIColor.black.setStroke()
        let rodEnd = CGPoint(
            x: CGFloat( cos(circle.rotation + circle.phaseShift)) * radius + point.x,
            y: CGFloat(-sin(circle.rotation + circle.phaseShift)) * radius + point.y
        )
        let rod = UIBezierPath()
        rod.move(to: point)
        rod.addLine(to: rodEnd)
        rod.lineWidth = 3
        rod.stroke()
        
        return rodEnd
    }
    
    private func drawGraphMarker(from: CGPoint) {
        guard circles.count > 0 else { return }
        
        UIColor(white: 0, alpha: 0.3).set()
        
        let cycleDuration = (1/circles[0].frequency) * periodsToDraw
        let drawProgress = duration.truncatingRemainder(dividingBy: cycleDuration) / cycleDuration
        
        let graphWidth = (graphEndX - graphStartX) * bounds.width
        let to = CGPoint(x: graphStartX * bounds.width + graphWidth * CGFloat(drawProgress), y: from.y)
        
        let horizontalMarker = UIBezierPath()
        horizontalMarker.move(to: from)
        horizontalMarker.addLine(to: to)
        horizontalMarker.lineWidth = 3
        var dashPattern: [CGFloat] = [10.0, 10.0]
        horizontalMarker.setLineDash(&dashPattern, count: dashPattern.count, phase: 0)
        horizontalMarker.lineCapStyle = .round
        horizontalMarker.stroke()
        
        let dotRadius = CGFloat(4)
        let dotFrame = CGRect(
            x: to.x - dotRadius,
            y: to.y - dotRadius,
            width: dotRadius * 2,
            height: dotRadius * 2
        )
        let dot = UIBezierPath(ovalIn: dotFrame)
        dot.fill()
    }
    
}
