//#-code-completion(everything, hide)
//#-code-completion(bookauxiliarymodule, show)
//#-code-completion(identifier, show, ), (, =, shouldDrawIndividualSines, true, false, circles)
//#-code-completion(identifier, hide, CirclesView, SineView)
//#-hidden-code
import PlaygroundSupport
import UIKit

var circles = [Circle]()
var shouldDrawIndividualSines = false
//#-end-hidden-code
/*:
# Waveforms
 There are a lot of different kinds of waves that can be created by combining circles. I've created a function for each of the three most common ones so you can try them out. They are as follows:
 - `func sawtooth(harmonies: Int, fundamentalFrequency: Double)`
 - `func square(harmonies: Int, fundamentalFrequency: Double)`
 - `func triangle(harmonies: Int, fundamentalFrequency: Double)`
 
 The [harmonies](glossary://Harmony) argument specifies the number of circles, while the [fundamental frequency](glossary://Fundamental%20Frequency) argument specifies the frequency of the innermost circle.
 
 The sawtooth wave you already know. Try replacing it with one of the other.
*/
circles = sawtooth(harmonies: 10, fundamentalFrequency: 0.2)

shouldDrawIndividualSines = false
//#-hidden-code
let sineView = SineView()
sineView.circles = circles
sineView.shouldDrawIndividualSines = shouldDrawIndividualSines

let desiredDuration: Double = 10 // seconds
sineView.periodsToDraw = desiredDuration * circles[0].frequency

PlaygroundPage.current.liveView = sineView
//#-end-hidden-code
