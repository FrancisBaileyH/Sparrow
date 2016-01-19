import Foundation


class Command {

  var message: ClientMessage

  required init(message: ClientMessage) {
    self.message = message
  }
}
