/*
 * Author: fbailey
 * Date:   2016-01-21T13:53:44-08:00
 * Last modified by:   fbailey
 * Last modified time: 2016-01-21T13:53:44-08:00
*/

import swiftysockets
import Foundation


enum ConnectionError: ErrorType {
  case SendError
  case ReadError
  case ParseError
  case MessageSizeExceededError
}


class ClientConnection {

  private var socket: TCPClientSocket

  private let MAX_MESSAGE_SIZE = 512

  init(socket: TCPClientSocket) {
    self.socket = socket
  }


  /*
   * Read incoming messages and parse them
  */
  func readLine() throws -> Executable {

      do {
        if let message = try self.socket.receiveString(untilDelimiter: "\n") {
          print("Recieved from client \(message)")

          guard sizeofValue(message) <= self.MAX_MESSAGE_SIZE else {
            throw ConnectionError.MessageSizeExceededError
          }

          return try self.parseMessage(message)
        }

        throw ConnectionError.ReadError
      }
      catch is TCPError {
          throw ConnectionError.ReadError
      }
  }


  /*
   * Parse the incoming message into a Command Object
  */
  private func parseMessage(message: String) throws -> Executable {

    if let parsedMsg = CommandParser.parse(message) {

      if let command = CommandFactory.build(parsedMsg) {
        return command
      }
    }

    throw ConnectionError.ParseError
  }


  /*
   * Send a message through the socket
  */
  func sendLine(message: String) throws {
    do {
      try self.socket.sendString(message)
      try self.socket.flush()
    }
    catch _ {
      throw ConnectionError.SendError
    }
  }

}
