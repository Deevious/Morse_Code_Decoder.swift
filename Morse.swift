var englishText = "this is a secret message"

// Secret message to decode.
var secretMessage = ".... --- .-- -.. -.--   .--. .- .-. - -. . .-."

// Letters in Morse-Code.
var letterToMorse = [
  "a": ".-",
  "b": "-...",
  "c": "-.-.",
  "d": "-..",
  "e": ".",
  "f": "..-.",
  "g": "--.",
  "h": "....",
  "i": "..",
  "j": ".---",
  "k": "-.-",
  "l": ".-..",
  "m": "--",
  "n": "-.",
  "o": "---",
  "p": ".--.",
  "q": "--.-",
  "r": ".-.",
  "s": "...",
  "t": "-",
  "u": "..-",
  "v": "...-",
  "w": ".--",
  "x": "-..-",
  "y": "-.--",
  "z": "--..",
  ".": ".-.-.-",
  "?": "..--..",
  ",": "--..--",
  "!": "-.-.--"
]

// Empty string to store morse code message.
var morseText = ""

// Loop through each char in englishText.
for element in englishText {
  // Check if the val exists in dictionary.
  if let morseChar = letterToMorse["\(element)"] {
    // Append the letter to morseText
    // Adding single space between chars, as it is with morse code.
    morseText += morseChar + " "
  } else {
    // Adding three spaces between words, as it is with morse.
    morseText += "   "
  }
}
//print(morseText)

// Stores the decoded morse code message.
var decodedMessage = ""

// Stores individual values of morse code letters of 'secretMessage'.
var morseCodeArray: [String] = []

// Keeps track of current morse code letters.
var currMorse = ""

// Iterates through each char of secretMessage.
for char in secretMessage {
  if char != " " {
    currMorse.append(char)
  } else {
    switch currMorse {
      case "":
        currMorse.append(" ")
      case " ":
        morseCodeArray.append(" ")
        currMorse = ""
      default:
        morseCodeArray.append(currMorse)
        currMorse = ""
    }
  }
}

// Appending currMorse to morseCodeArray.
morseCodeArray.append(currMorse)
//print(morseCodeArray)

// Empty Dictionary, to store value of iteration of lettersToMorse.
var morseToLetter: [String: String] = [:]

// Populating morseToLetter with key:val pairs from letterToMorse.
for (letter, morseChar) in letterToMorse {
  morseToLetter[morseChar] = letter
}
//print(morseToLetter)

// Decoding the secret message.
for morseValue in morseCodeArray {
  if let letterToChar = morseToLetter[morseValue] {
    decodedMessage.append(letterToChar)
  } else {
    decodedMessage.append(" ")
  }
}
print(decodedMessage)