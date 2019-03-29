/*:
 # Creating Random Numbers
 */
import UIKit

let upperLimit = 50 // upper limit for random number (0 is bottom)
let repetitions = 4 // number to generate

var random = arc4random_uniform(UInt32(upperLimit))
var randomString = String(random)

var i = 0

while i < repetitions {
  i += 1
  random = arc4random_uniform(UInt32(upperLimit))
  print (random)
}