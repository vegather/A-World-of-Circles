//#-code-completion(everything, hide)
//#-code-completion(identifier, show, radius, frequency, circle, ., =)
//#-hidden-code
import PlaygroundSupport
import UIKit

//#-end-hidden-code
/*: 
# Sine Wave
Rotating circles and [sine waves](glossary://Sine%20Wave) are very closely related. Notice how the [amplitude](glossary://Amplitude) of the sine wave is closely related to the [radius](glossary://Radius) of the circle, and how the [frequency](glossary://Frequency) of the sine wave is closely related to the rotation frequency of the circle.
 
Try changing the radius and frequency of the circle now, and see how it affects the sine wave.
*/
let circle = Circle()
//#-editable-code
circle.radius = 1.3
circle.frequency = 0.5
//#-end-editable-code
//#-hidden-code
let sineView = SineView()
sineView.circles = [circle]

let desiredDuration: Double = 4 // seconds
sineView.periodsToDraw = desiredDuration * circle.frequency

PlaygroundPage.current.liveView = sineView
//#-end-hidden-code
