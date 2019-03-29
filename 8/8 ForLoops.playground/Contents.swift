let myArray = ["dog", 4.6] as [Any]
let myDictionary = ["name": "Rover", "weight": 20.5] as [String : Any]
let mySet = ["name", "weight"]

for (index, item) in myArray.enumerated() {
  print ("index: " + String(index) + " item:" + String(describing: item))
}

for (key, value) in myDictionary {
  print ("key:" + key + " value:" + String(describing: value))
  //print ("\n")
}

