/*
 * Author: fbailey
 * Date:   2016-01-21T14:30:07-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:30:07-08:00
*/

protocol LoggerInterface {

  func log(message: String, logLevel: LogLevel)
}

enum LogLevel: Int {
  case Debug   = 7
  case Verbose = 4
  case Normal  = 1
}
