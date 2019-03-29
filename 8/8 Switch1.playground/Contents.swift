var myUserID:Int?

myUserID = 6

if let userID = myUserID {
  switch (userID) {
  case 5..<9: print ("first example:" + String(userID))
  default: print ("not a known ID")
  }
}

if let userID2 = myUserID {
  switch (userID2) {
  case 5..<9: print ("not a preferred user:" + String(userID2))    
  case 5..<9 where userID2 < 7: print ("preferred user:" + String(userID2))

  default: print ("not a known ID")

  }
}
