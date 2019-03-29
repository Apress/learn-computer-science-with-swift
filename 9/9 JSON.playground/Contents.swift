import Foundation

let myArray = ["one", "two", "three"]

print (myArray)

let jsonEncoder = JSONEncoder()

jsonEncoder.outputFormatting = .prettyPrinted

if let encodeToJSON = try? jsonEncoder.encode(myArray) {
  if let decodeFromJSON = String(data: encodeToJSON, encoding: .utf8) {
    print (decodeFromJSON)
  } else {
    print ("failed")
  }
  print ("did encode")
} else {
  print ("failed2")
}
