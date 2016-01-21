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
