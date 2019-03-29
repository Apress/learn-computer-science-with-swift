//: Playground - noun: a place where people can play

//import UIKit

typealias productName = String

var widget1:productName = "Widget 1"
var widget2:productName = "Widget 2"

var inventory = Array <productName>()

inventory = [widget1, widget2]
inventory += [widget1]

print (inventory)

inventory += ["dog"]
print (inventory)

inventory += ["17"]
print (inventory)
