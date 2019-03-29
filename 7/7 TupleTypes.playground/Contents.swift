//: Tuples and Types
typealias dimensions = (Double,Double)
var myRectangle:dimensions = (2.0, 30.0)
print (myRectangle)
var myRectangle2: (Double, Double) = (5.0, 20)
print (myRectangle2)
typealias dimensionsLabeled = (width: Double, height: Double)
var mylabeledRectangle:dimensionsLabeled = (32.0, 64.0)
print (mylabeledRectangle.0, mylabeledRectangle.height)