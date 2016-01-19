import Foundation


class Command {

  private var message: ClientMessage

  required init(message: ClientMessage) {
    self.message = message
  }
}
