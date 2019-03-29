enum Suit:Double {
  case club = 15.3
  case spade = 32.6
  case heart = 0.0
  case diamond = -42.3
}

let cardSuit = Suit.spade

print (cardSuit)

print (cardSuit.rawValue)
