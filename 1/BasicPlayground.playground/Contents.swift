/*:
 # Swift Playground for Jesse Feiler‘s Computer Science Book

## Store data in arrays
Here's an array of arrays using JSON syntax
*/
var myArray = [
[
  "Date":513960111.567905,
  "Layers":50,
  "Recycling":0.3567828407287643,
  "Score":150,
  "Thermostat":50,
  "Trash":50,
  "Windows":50
  ],

[
  "Date":513960122.893972,
  "Layers":50,
  "Recycling":99.99900000000001,
  "Score":150,
  "Thermostat":50,
  "Trash":50,
  "Windows":50
  ]
]

//: ## Create a variable to store data
let valuesMap = myArray.map {$0["Score"]}
//: ## Print it out
print (" valuesMap: \(valuesMap)")

//: ### Do it for another variable
let sortedMap = myArray.sorted(by: {(s1, s2) in return s1["Score"]! < s2["Score"]!})
print (" sortedMap: \(sortedMap.map{$0["Score"]})")
