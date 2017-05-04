//#-code-completion(everything, hide)
//#-code-completion(bookauxiliarymodule, show)
//#-code-completion(identifier, show, ), (, innerCircle, outerCircle, =, shouldDrawIndividualSines, true, false)
//#-code-completion(identifier, hide, CirclesView, sawtooth(), square(), triangle(), SineView, sawtooth(harmonies:fundamentalFrequency:), triangle(harmonies:fundamentalFrequency:), square(harmonies:fundamentalFrequency:))
//#-hidden-code
import PlaygroundSupport
import UIKit

var innerCircle = Circle()
var outerCircle = Circle()
var shouldDrawIndividualSines = false
//#-end-hidden-code
/*:
# Adding Circles
Circles can be combined to create more complex [sine waves](glossary://Sine%20Wave). In this example, the outer circle moves around the [circumference](glossary://Circumference) of the inner circle. This has the effect of adding together the two sine waves. Currently, the outer circle has a smaller [radius](glossary://Radius) and a higher [frequency](glossary://Frequency) than the inner circle. Try modifying the two circles, and see how it affects the resulting sine wave.
*/
innerCircle = Circle(radius: 1.0, frequency: 0.1)
outerCircle = Circle(radius: 0.5, frequency: 0.5)

/*:
Like I said, when the two circles are combined, it has the effect of adding together the individual sine waves. Try setting `shouldDrawIndividualSines` to `true` to see what the individual sine waves looks like. 
*/
shouldDrawIndividualSines = false

//#-hidden-code
let sineView = SineView()
sineView.circles = [innerCircle, outerCircle]
sineView.shouldDrawIndividualSines = shouldDrawIndividualSines
PlaygroundPage.current.liveView = sineView
//#-end-hidden-code
