/*:
 # Creating and Storing Random Numbers
 */
 import UIKit
let upperLimit = 50 // upper limit for random number (0 is bottom)
let repetitions = 4 // number to generate

var i = 0

var repetitionArray = [UInt32]()

while i < repetitions {
  i += 1
  let x = arc4random_uniform(UInt32(upperLimit))
  repetitionArray.append(x)
  print (repetitionArray)
}
print (repetitionArray[1])
