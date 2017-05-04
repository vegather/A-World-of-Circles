//#-code-completion(everything, hide)
//#-code-completion(identifier, show, radius, frequency, circle, ., =)
//#-hidden-code
import PlaygroundSupport
import UIKit

//#-end-hidden-code
/*:
# Circle 
This is a circle that rotates around itself. It has a [radius](glossary://Radius), which describes its size. It also has a [frequency](glossary://Frequency), which says how many times it rotates around itself per second.

 Try changing the radius and frequency, and see what happens.
*/
var circle = Circle()
//#-editable-code
circle.radius = 1.3
circle.frequency = 0.5
//#-end-editable-code
//#-hidden-code
let circlesView = CirclesView()
circlesView.circles = [circle]
circlesView.shouldDrawMarker = false
circlesView.radiusMultiplier = 60
circlesView.circlesCenterX = 0.5
circlesView.backgroundColor = UIColor(white: 0.95, alpha: 1)
circlesView.isOpaque = true

PlaygroundPage.current.liveView = circlesView
//#-end-hidden-code
