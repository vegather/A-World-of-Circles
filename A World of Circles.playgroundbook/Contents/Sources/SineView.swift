//
//  SineView.swift
//  Sine Demo
//
//  Created by Vegard Solheim Theriault on 07/03/2017.
//  Copyright © 2017 Vegard Solheim Theriault. All rights reserved.
//

import UIKit

public class SineView: UIView {
    
    private var circlesView: CirclesView?
    public var periodsToDraw = 2.0 {
        didSet {
            circlesView?.periodsToDraw = periodsToDraw
        }
    }
    
    internal var radiusMultiplier: CGFloat = 60 {
        didSet {
            setNeedsDisplay()
            circlesView?.radiusMultiplier = radiusMultiplier
        }
    }
    public var circles: [Circle]? {
        didSet {
            if let circles = circles {
                setNeedsDisplay()
                circlesView?.circles = circles
                circlesView?.reset()
            }
        }
    }
    public var shouldDrawIndividualSines = false {
        didSet { setNeedsDisplay() }
    }
    
    private struct Ratios {
        static let circlesCenter : CGFloat = 0.18
        static let graphStartX   : CGFloat = 0.4
        static let graphEndX     : CGFloat = 0.99
    }
    
    
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
        backgroundColor = UIColor(white: 0.95, alpha: 1)
        contentMode = .redraw
        
        circlesView = CirclesView(frame: bounds)
        if let circles = circles {
            circlesView?.circles = circles
        }
        circlesView?.radiusMultiplier = radiusMultiplier
        circlesView?.periodsToDraw    = periodsToDraw
        circlesView?.graphStartX      = Ratios.graphStartX
        circlesView?.graphEndX        = Ratios.graphEndX
        circlesView?.circlesCenterX   = Ratios.circlesCenter
        
        if let circlesView = circlesView {
            addSubview(circlesView)
        }
    }
    
    public override func layoutSubviews() {
        circlesView?.frame = bounds
    }
    
    
    
    // -------------------------------
    // MARK: Drawing
    // -------------------------------
    
    public override func draw(_ rect: CGRect) {
        let circlesCenter = CGPoint(x: bounds.width * Ratios.circlesCenter, y: bounds.midY)
        
        drawGrid(withCenterPoint: circlesCenter)
        
        guard let circles = circles, circles.count > 0 else { return }
        
        let graphRect = CGRect(
            x: bounds.width * Ratios.graphStartX,
            y: 0,
            width: bounds.width * (Ratios.graphEndX - Ratios.graphStartX),
            height: bounds.height
        )
        
        if shouldDrawIndividualSines {
            UIColor(white: 0, alpha: 0.1).setStroke()
            circles.forEach {
                graphPath(
                    from: [$0],
                    in: graphRect,
                    withRadiusMultiplier: radiusMultiplier,
                    periodsToDraw: ($0.frequency / circles[0].frequency) * periodsToDraw,
                    lineWidth: 1
                    ).stroke()
            }
        }
        
        UIColor(white: 0, alpha: 0.6).setStroke()
        graphPath(
            from: circles,
            in: graphRect,
            withRadiusMultiplier: radiusMultiplier,
            periodsToDraw: periodsToDraw,
            lineWidth: 2
            ).stroke()
    }
    
    private func drawGrid(withCenterPoint point: CGPoint) {
        UIColor(white: 0.9, alpha: 1).setStroke()
        
        let horizontalGridLine = UIBezierPath()
        horizontalGridLine.move(to: CGPoint(x: 0, y: bounds.midY))
        horizontalGridLine.addLine(to: CGPoint(x: bounds.width, y: bounds.midY))
        horizontalGridLine.stroke()
        
        let verticalGridLine = UIBezierPath()
        verticalGridLine.move(to: CGPoint(x: point.x, y: 0))
        verticalGridLine.addLine(to: CGPoint(x: point.x, y: bounds.height))
        verticalGridLine.stroke()
    }
    
}
