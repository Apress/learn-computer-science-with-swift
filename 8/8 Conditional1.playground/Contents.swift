let x = 10
var message = "no messsage yet"

if x > 10 {
  message = "greater than 10"
} else {
  message = "not greater than 10"
}

print (message)

message = x > 10 ? "greater than 10" : "not greater than 10"
