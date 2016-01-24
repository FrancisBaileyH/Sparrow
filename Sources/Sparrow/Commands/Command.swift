/*
 * Author: fbailey
 * Date:   2016-01-21T14:29:02-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T14:29:02-08:00
*/

import Foundation


class Command: Cancellable {

  var message: ClientMessage
  var cancelled: Bool

  required init(message: ClientMessage) {
    self.message = message
    self.cancelled = false
  }

  func cancel() {
    self.cancelled = true
  }

  func isCancelled() -> Bool {
    return self.cancelled
  }

}
