/*
 * Author: fbailey
 * Date:   2016-01-21T14:02:24-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:02:24-08:00
*/

protocol Cancellable {
  func cancel()
  func isCancelled() -> Bool
}
