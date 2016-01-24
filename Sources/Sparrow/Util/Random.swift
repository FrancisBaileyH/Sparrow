/*
 * Author: fbailey
 * Date:   2016-01-21T14:30:53-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:30:53-08:00
*/

#if os(Linux)
  import Glibc
#else
  import Foundation
#endif

class Random {

  static func randomString(length: Int) -> String {

    let allowedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    let allowedCharsCount = Int32(allowedChars.characters.count)
    var randomString = ""

    #if os(Linux)
      srand(UInt32(time(nil)))
    #endif

    for _ in (0..<length) {
      #if os(Linux)
        let tmpNum = rand() % allowedCharsCount
        let randomNum = Int(tmpNum)
      #else
        let randomNum = Int(arc4random_uniform(allowedCharsCount))
      #endif

      let newCharacter = allowedChars[allowedChars.startIndex.advancedBy(randomNum)]
      randomString += String(newCharacter)
    }

    return randomString
  }

}
