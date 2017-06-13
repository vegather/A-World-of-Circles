//#-code-completion(everything, hide)
//#-code-completion(bookauxiliarymodule, show)
//#-code-completion(literal, show, array)
//#-code-completion(identifier, show, ), (, =, shouldDrawIndividualSines, true, false, sawtooth)
//#-code-completion(identifier, hide, CirclesView, sawtooth(), square(), triangle(), SineView, sawtooth(harmonies:fundamentalFrequency:), triangle(harmonies:fundamentalFrequency:), square(harmonies:fundamentalFrequency:))
//#-hidden-code
import PlaygroundSupport
import UIKit

var sawtooth = [Circle]()
var shouldDrawIndividualSines = false
//#-end-hidden-code
/*:
# Sawtooth Wave
When many circles are added together, the resulting sine wave is called a [compound sine waves](glossary://Compound%20Sine%20Wave). When some specific pattern is followed, some pretty cool patterns emerge. Below is the first four circles of what is called a [sawtooth wave](glossary://Sawtooth%20Wave). Notice how the [radius](glossary://Radius) follows the pattern `k/1, k/2, k/3, k/4` for each circle, while the [frequency](glossary://Frequency) follows the pattern `k*1, k*2, k*3, k*4`.
*/
sawtooth = [
    Circle(radius: 1.00, frequency: 0.2),
    Circle(radius: 0.50, frequency: 0.4),
    Circle(radius: 0.33, frequency: 0.6),
    Circle(radius: 0.25, frequency: 0.8)
]
/*:
 If we kept adding more and more circles by following the same pattern, the resulting sine wave would look more and more like a perfect sawtooth wave.
 
 Again, I encourage you to see what each individual sine wave looks like.
*/
shouldDrawIndividualSines = false
//#-hidden-code
let sineView = SineView()
sineView.circles = sawtooth
sineView.periodsToDraw = 2
sineView.shouldDrawIndividualSines = shouldDrawIndividualSines

PlaygroundPage.current.liveView = sineView
//#-end-hidden-code
