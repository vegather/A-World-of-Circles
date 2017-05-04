//#-code-completion(everything, hide)
//#-code-completion(bookauxiliarymodule, show)
//#-code-completion(literal, show, array)
//#-code-completion(identifier, show, ), (, =, shouldDrawIndividualSines, true, false, circles)
//#-code-completion(identifier, hide, CirclesView, SineView)
//#-hidden-code
import PlaygroundSupport
import UIKit

var circles = [Circle]()
var shouldDrawIndividualSines = false
//#-end-hidden-code
/*: 
# Build Your Own
 Now it's your turn. Try building up a chain of circles, and see what it looks like. See what happens when you change the frequency and radius of the different circles.
 */
circles = [
    Circle(radius: 1.0, frequency: 0.5),
    Circle(radius: 0.3, frequency: 2.0)
]

shouldDrawIndividualSines = false
//#-hidden-code
let sineView = SineView()
sineView.circles = circles
sineView.shouldDrawIndividualSines = shouldDrawIndividualSines

PlaygroundPage.current.liveView = sineView
//#-end-hidden-code
